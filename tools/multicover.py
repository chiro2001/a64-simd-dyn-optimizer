#!/usr/bin/env python3
"""Multicover runtime support for build_preload_so.py (docs/87 step 2).

For kernels with an AGO covers module (cover_meta), compile every cover
into one LD_PRELOAD .so under a distinct symbol and generate a small
runtime dispatcher:

  * AGO_PRESET=v1:<fp>:<kernel>=<ord>,...  select covers at load time
    (fingerprint + whitelist + ordinal bounds; any error -> ignore the
    whole preset and keep build-time defaults).
  * AGO_BENCH=1  run a CNTVCT sweep of all compiled covers (ord 0 =
    upstream when patched) and print a fresh preset line.
  * AGO_DEBUG=1  trace parse/apply decisions to stderr.

Cover ids follow the registry (tools/cover_registry.py / docs/88):
0 = upstream dispatch, 1..N = cover_meta() order. Symbol renaming of
emitted/checked-in sources is mechanical: each cover source must define
the kernel symbol and is rewritten to its cover symbol (verified below).
"""

import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
if ROOT not in sys.path:
    sys.path.insert(0, ROOT)
if os.path.join(ROOT, "tools") not in sys.path:
    sys.path.insert(0, os.path.join(ROOT, "tools"))
if os.path.join(ROOT, "optimizer") not in sys.path:
    sys.path.insert(0, os.path.join(ROOT, "optimizer"))

from bench_specs import spec as _bench_spec

# ---- cover planning ---------------------------------------------------------


def rname(kernel):
    return kernel.replace("-", "_").replace(".", "_")


def cov_symbol(kernel, cover_id):
    return "dynopt_%s_cov%d" % (rname(kernel), cover_id)


def trampoline(kernel):
    return "dynopt_%s_tr" % rname(kernel)


def rename_symbol(src, kernel_sym, new_sym):
    """Rename the kernel symbol in an emitted/checked-in source."""
    n = src.count(kernel_sym)
    if n == 0:
        raise ValueError("source does not define kernel symbol %r"
                         % kernel_sym)
    if n > 4:
        raise ValueError("source has %d occurrences of %r; refusing to "
                         "rename" % (n, kernel_sym))
    return src.replace(kernel_sym, new_sym)


def plan_covers(kernel, kernel_sym, workdir, default_src=None):
    """Return (covers, default_id) in registry order.

    default_id: the cover whose canonical source matches `default_src`
    (the build's current candidate_sources pick); falls back to a cover-
    identity scan, then to the first cover.
    """
    os.makedirs(workdir, exist_ok=True)
    from ago_auto_search import KERNEL_COVERS
    if kernel not in KERNEL_COVERS:
        return [], None
    module_name, _ = KERNEL_COVERS[kernel]
    module = __import__(module_name, fromlist=["emit_cover", "cover_meta"])
    meta = module.cover_meta()
    out = []
    for cid, letter in enumerate(meta.get("covers", []), start=1):
        func_name = cov_symbol(kernel, cid)
        try:
            src = module.emit_cover(letter, func_name)
        except TypeError:
            src = module.emit_cover(letter)
        except Exception as exc:
            raise RuntimeError("kernel %s cover %s emit failed: %s"
                               % (kernel, letter, exc))
        if kernel_sym in src:
            # Uniquify per-cover helper symbols (IR emission like
            # dynopt_dct16_op_pass1/2 is shared across covers and would
            # collide at link time). The exported wrapper symbol itself
            # is renamed afterwards.
            pat = re.compile(r'\bdynopt_%s_[A-Za-z0-9_]+'
                             % re.escape(rname(kernel)))

            def _uniq(m):
                name = m.group(0)
                if name == kernel_sym:
                    return name
                return name.replace('dynopt_%s_' % rname(kernel),
                                    'dynopt_%s_cov%d_'
                                    % (rname(kernel), cid))

            src = pat.sub(_uniq, src)
            src = rename_symbol(src, kernel_sym, func_name)
        path = os.path.join(workdir, "%s-cover-%d.cpp" % (rname(kernel), cid))
        with open(path, "w", encoding="utf-8") as f:
            f.write(src)
        out.append({"id": cid, "letter": letter,
                    "func_name": func_name, "src": path})
    dflt = out[0]["id"] if out else None

    def canon(c):
        src = open(c["src"], encoding="utf-8").read()
        # Uniquified per-cover helper prefixes do not exist in the
        # pristine default source; strip cov<id>_ first (the wrapper
        # rename below must not catch their prefixes), then restore the
        # wrapper symbol.
        src = re.sub(r"(dynopt_%s_)cov%d_" % (re.escape(rname(kernel)),
                                              c["id"]), r"\1", src)
        src = src.replace(c["func_name"], kernel_sym)
        return src

    if default_src is not None:
        for c in out:
            if canon(c) == default_src:
                dflt = c["id"]
                break
    elif len(out) > 1:
        first = canon(out[0])
        for c in out:
            if canon(c) == first:
                dflt = c["id"]
                break
    return out, dflt


# ---- runtime C++ generation -------------------------------------------------


def _param_parts(params):
    return [p.strip() for p in params.split(",")]


def _typedef(ret, params, name):
    return "typedef %s (*%s)(%s);" % (ret, name, params)


def _decl_for(ret, params, fn):
    return "extern \"C\" %s %s(%s);" % (ret, fn, params)


def _arg_defs(params):
    return ", ".join("%s a%d" % (p, i)
                     for i, p in enumerate(_param_parts(params)))


def _arg_call(params):
    return ", ".join("a%d" % i if "*" in p else "64"
                     for i, p in enumerate(_param_parts(params)))


def _bench_buffers(params, spec=None):
    """Shape-aware buffers + scalar call values (docs/87 step 3)."""
    decls, args = [], []
    idx = 0
    bp = 0
    sp = 0
    for p in _param_parts(params):
        if "*" not in p:
            scalar = "64"
            if spec and spec.get("scalars") and sp < len(spec["scalars"]):
                scalar = str(spec["scalars"][sp])
            sp += 1
            args.append(scalar)
            continue
        size = 4096
        if spec and spec.get("buffers") and bp < len(spec["buffers"]):
            size = spec["buffers"][bp]
        bp += 1
        typ = p[:p.rindex("*")].strip()
        decls.append("    alignas(64) static uint8_t dynopt_b%d[%d] = {0};"
                     % (idx, size))
        args.append("(%s*)dynopt_b%d" % (typ, idx))
        idx += 1
    return decls, ", ".join(args)


def _runtime_utils():
    """Declaration-order utilities (must precede bench blocks)."""
    return [
        "static uint64_t dynopt_cnt(void) {",
        "    struct timespec ts; clock_gettime(CLOCK_MONOTONIC, &ts);",
        "    return (uint64_t)ts.tv_sec * 1000000000ULL + (uint64_t)ts.tv_nsec;",
        "}",
        "static uint32_t dynopt_rotr(uint32_t x, int n) { return (x >> n) | (x << (32 - n)); }",
        "typedef struct { uint32_t st[8]; uint64_t total; unsigned char buf[64]; size_t buflen; } dynopt_sha_ctx;",
        "static const uint32_t dynopt_sha_k[64] = {",
        "    0x428a2f98u,0x71374491u,0xb5c0fbcfu,0xe9b5dba5u,0x3956c25bu,0x59f111f1u,0x923f82a4u,0xab1c5ed5u,",
        "    0xd807aa98u,0x12835b01u,0x243185beu,0x550c7dc3u,0x72be5d74u,0x80deb1feu,0x9bdc06a7u,0xc19bf174u,",
        "    0xe49b69c1u,0xefbe4786u,0x0fc19dc6u,0x240ca1ccu,0x2de92c6fu,0x4a7484aau,0x5cb0a9dcu,0x76f988dau,",
        "    0x983e5152u,0xa831c66du,0xb00327c8u,0xbf597fc7u,0xc6e00bf3u,0xd5a79147u,0x06ca6351u,0x14292967u,",
        "    0x27b70a85u,0x2e1b2138u,0x4d2c6dfcu,0x53380d13u,0x650a7354u,0x766a0abbu,0x81c2c92eu,0x92722c85u,",
        "    0xa2bfe8a1u,0xa81a664bu,0xc24b8b70u,0xc76c51a3u,0xd192e819u,0xd6990624u,0xf40e3585u,0x106aa070u,",
        "    0x19a4c116u,0x1e376c08u,0x2748774cu,0x34b0bcb5u,0x391c0cb3u,0x4ed8aa4au,0x5b9cca4fu,0x682e6ff3u,",
        "    0x748f82eeu,0x78a5636fu,0x84c87814u,0x8cc70208u,0x90befffau,0xa4506cebu,0xbef9a3f7u,0xc67178f2u",
        "};",
        "static void dynopt_sha_block(uint32_t st[8], const unsigned char* p) {",
        "    uint32_t w[64];",
        "    for (int i = 0; i < 16; i++)",
        "        w[i] = ((uint32_t)p[i * 4] << 24) | ((uint32_t)p[i * 4 + 1] << 16) |",
        "               ((uint32_t)p[i * 4 + 2] << 8) | (uint32_t)p[i * 4 + 3];",
        "    for (int i = 16; i < 64; i++) {",
        "        uint32_t s0 = dynopt_rotr(w[i - 15], 7) ^ dynopt_rotr(w[i - 15], 18) ^ (w[i - 15] >> 3);",
        "        uint32_t s1 = dynopt_rotr(w[i - 2], 17) ^ dynopt_rotr(w[i - 2], 19) ^ (w[i - 2] >> 10);",
        "        w[i] = w[i - 16] + s0 + w[i - 7] + s1;",
        "    }",
        "    uint32_t a = st[0], b = st[1], c = st[2], d = st[3], e = st[4], f = st[5], g = st[6], h = st[7];",
        "    for (int i = 0; i < 64; i++) {",
        "        uint32_t S1 = dynopt_rotr(e, 6) ^ dynopt_rotr(e, 11) ^ dynopt_rotr(e, 25);",
        "        uint32_t ch = (e & f) ^ (~e & g);",
        "        uint32_t t1 = h + S1 + ch + dynopt_sha_k[i] + w[i];",
        "        uint32_t S0 = dynopt_rotr(a, 2) ^ dynopt_rotr(a, 13) ^ dynopt_rotr(a, 22);",
        "        uint32_t maj = (a & b) ^ (a & c) ^ (b & c);",
        "        uint32_t t2 = S0 + maj;",
        "        h = g; g = f; f = e; e = d + t1; d = c; c = b; b = a; a = t1 + t2;",
        "    }",
        "    st[0] += a; st[1] += b; st[2] += c; st[3] += d;",
        "    st[4] += e; st[5] += f; st[6] += g; st[7] += h;",
        "}",
        "static void dynopt_sha_init(dynopt_sha_ctx* c) {",
        "    c->st[0] = 0x6a09e667u; c->st[1] = 0xbb67ae85u; c->st[2] = 0x3c6ef372u; c->st[3] = 0xa54ff53au;",
        "    c->st[4] = 0x510e527fu; c->st[5] = 0x9b05688cu; c->st[6] = 0x1f83d9abu; c->st[7] = 0x5be0cd19u;",
        "    c->total = 0; c->buflen = 0;",
        "}",
        "static void dynopt_sha_update(dynopt_sha_ctx* c, const unsigned char* d, size_t n) {",
        "    c->total += n;",
        "    while (n) {",
        "        size_t take = 64 - c->buflen;",
        "        if (take > n) take = n;",
        "        memcpy(c->buf + c->buflen, d, take);",
        "        c->buflen += take; d += take; n -= take;",
        "        if (c->buflen == 64) { dynopt_sha_block(c->st, c->buf); c->buflen = 0; }",
        "    }",
        "}",
        "static void dynopt_sha_final(dynopt_sha_ctx* c, unsigned char out[32]) {",
        "    uint64_t bits = c->total * 8;",
        "    unsigned char pad[128];",
        "    pad[0] = 0x80;",
        "    size_t plen = (c->buflen < 56) ? (56 - c->buflen) : (120 - c->buflen);",
        "    memset(pad + 1, 0, plen - 1);",
        "    for (int k = 0; k < 8; k++) pad[plen + k] = (unsigned char)(bits >> (56 - k * 8));",
        "    dynopt_sha_update(c, pad, plen + 8);",
        "    for (int j = 0; j < 8; j++) {",
        "        out[j * 4] = (unsigned char)(c->st[j] >> 24);",
        "        out[j * 4 + 1] = (unsigned char)(c->st[j] >> 16);",
        "        out[j * 4 + 2] = (unsigned char)(c->st[j] >> 8);",
        "        out[j * 4 + 3] = (unsigned char)c->st[j];",
        "    }",
        "}",
        "static void dynopt_sha256(const unsigned char* data, size_t n, unsigned char out[32]) {",
        "    dynopt_sha_ctx c; dynopt_sha_init(&c); dynopt_sha_update(&c, data, n); dynopt_sha_final(&c, out);",
        "}",
        "static void dynopt_sha256_file(const char* path, unsigned char out[32]) {",
        "    FILE* f = fopen(path, \"rb\");",
        "    if (!f) { memset(out, 0, 32); return; }",
        "    dynopt_sha_ctx c; dynopt_sha_init(&c);",
        "    unsigned char buf[8192]; size_t got;",
        "    while ((got = fread(buf, 1, sizeof(buf), f)) > 0) dynopt_sha_update(&c, buf, got);",
        "    fclose(f);",
        "    dynopt_sha_final(&c, out);",
        "}",
        "static char dynopt_so_path_[512] = {0};",
        "static int dynopt_so_cb(struct dl_phdr_info* info, size_t, void*) {",
        "    if (!info || !info->dlpi_name) return 0;",
        "    if (strstr(info->dlpi_name, \"dynopt\")) {",
        "        snprintf(dynopt_so_path_, sizeof(dynopt_so_path_), \"%s\", info->dlpi_name);",
        "        return 1;",
        "    }",
        "    return 0;",
        "}",
        "static void dynopt_so_path(char* out, size_t n) {",
        "    if (dynopt_so_path_[0]) { snprintf(out, n, \"%s\", dynopt_so_path_); return; }",
        "    dl_iterate_phdr(dynopt_so_cb, 0);",
        "    snprintf(out, n, \"%s\", dynopt_so_path_);",
        "}",
        "static int dynopt_fp_ok(const char* s) {",
        "    if (!s || s[0] != 'm' || strlen(s) != 9) return 0;",
        "    for (int i = 1; i < 9; i++) {",
        "        char c = s[i];",
        "        if (!((c >= '0' && c <= '9') || (c >= 'a' && c <= 'f'))) return 0;",
        "    }",
        "    return 1;",
        "}",
        "static void dynopt_host_fp(char* out, size_t n) {",
        "    char feat[192] = \"\";",
        "    FILE* f = fopen(\"/proc/cpuinfo\", \"r\");",
        "    if (f) { char ln[256];",
        "        while (fgets(ln, sizeof(ln), f))",
        "            if (!strncmp(ln, \"Features\", 8)) {",
        "                snprintf(feat, sizeof(feat), \"%s\", ln);",
        "                break;",
        "            }",
        "        fclose(f);",
        "    }",
        "    int vl = 16;",
        "#if defined(__ARM_FEATURE_SVE)",
        "    vl = (int)svcntw();",
        "#endif",
        "    char so[512] = \"-\"; dynopt_so_path(so, sizeof(so));",
        "    unsigned char soh[32]; dynopt_sha256_file(so[0] ? so : \"-\", soh);",
        "    char mstr[1024];",
        "    snprintf(mstr, sizeof(mstr), \"%s%s|%s|%d|%s|%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x|%s\",",
        "             feat, (feat[0] ? \"|\" : \"\"),",
        "#ifdef AGO_ISA_STR",
        "             AGO_ISA_STR,",
        "#else",
        "             \"unknown\",",
        "#endif",
        "             vl, __VERSION__,",
        "             soh[0], soh[1], soh[2], soh[3], soh[4], soh[5], soh[6], soh[7],",
        "             soh[8], soh[9], soh[10], soh[11], soh[12], soh[13], soh[14], soh[15],",
        "             \"\");",
        "    unsigned char h[32];",
        "    dynopt_sha256((const unsigned char*)mstr, strlen(mstr), h);",
        "    snprintf(out, n, \"m%02x%02x%02x%02x\", h[0], h[1], h[2], h[3]);",
        "}",
        "static int dynopt_intercepted_ = 0;",
        "extern \"C\" void dynopt_mark_intercepted(void) { dynopt_intercepted_ = 1; }",
        "extern \"C\" int dynopt_intercept_status(void) { return dynopt_intercepted_; }",
        "static int dynopt_ord_ok(const char* s) {",
        "    if (!s || !*s) return 0;",
        "    for (; *s; s++) if (*s < '0' || *s > '9') return 0;",
        "    return 1;",
        "}",
    ]


def _bench_block(k, spec=None):
    """Median-of-rounds bench with upstream pairing (docs/87 step 3)."""
    kn = rname(k["kernel"])
    n = max(k["cover_ids"]) + 1
    decls, call = _bench_buffers(k["params"], spec)
    parts = ["static uint64_t dynopt_%s_bench(void) {" % kn,
             "    int R = 2000, rounds = 5, maxord = %d;" % n,
             "    { const char* ir = getenv(\"AGO_BENCH_ITERS\");",
             "      if (ir && atoi(ir) > 0) R = atoi(ir); }",
             "    { const char* rr = getenv(\"AGO_BENCH_ROUNDS\");",
             "      if (rr && atoi(rr) > 0 && atoi(rr) <= 8) rounds = atoi(rr); }",
             "    { const char* mo = getenv(\"AGO_BENCH_MAXORD\");",
             "      if (mo && atoi(mo) > 0 && atoi(mo) < maxord) maxord = atoi(mo); }"]
    parts += decls
    parts += [
        "    int best = -1; uint64_t bc = ~0ULL, up_ns = 0;",
        "    for (int ord = 0; ord < maxord; ord++) {",
        "        dynopt_%s_t fn = (ord == 0) ? dynopt_%s_up : dynopt_%s_fns[ord];"
        % (kn, kn, kn),
        "        if (!fn) continue;",
        "        for (int i = 0; i < 200; i++) fn(%s);" % call,
        "        uint64_t med[8]; int nr = 0;",
        "        for (int r = 0; r < rounds; r++) {",
        "            uint64_t t0 = dynopt_cnt();",
        "            for (int i = 0; i < R; i++) fn(%s);" % call,
        "            uint64_t t1 = dynopt_cnt();",
        "            med[nr++] = (t1 - t0) / (uint64_t)R;",
        "        }",
        "        for (int i = 1; i < nr; i++) {",
        "            uint64_t v = med[i]; int j = i - 1;",
        "            while (j >= 0 && med[j] > v) { med[j + 1] = med[j]; j--; }",
        "            med[j + 1] = v;",
        "        }",
        "        uint64_t dt = med[nr / 2];",
        "        if (ord == 0) up_ns = dt;",
        "        fprintf(stderr, \"dynopt: bench " + k["kernel"] +
        " ord=%d ns/call=%llu\\n\", ord, dt);",
        "        if (dt < bc) { bc = dt; best = ord; }",
        "    }",
    ]
    parts.append('    fprintf(stderr, "dynopt: bench ' + k["kernel"] +
                 ' chosen=ord%d ns=%llu upstream_ns=%llu\\n",'
                 ' best < 0 ? -1 : best, best < 0 ? 0ULL : bc, up_ns);')
    parts += [
        "    return best < 0 ? (unsigned)-1 : (unsigned)best;",
        "}",
    ]
    return parts


def runtime_cpp(kernels, bench_kernels=None):
    """Generate the multicover runtime block (docs/88 §2/§3)."""
    bench_kernels = set(bench_kernels or [])
    parts = ["// ---- multicover runtime (generated, docs/87 step 2) ----",
             "#include <dlfcn.h>",
             "#include <link.h>",
             "#include <stdio.h>",
             "#include <stdlib.h>",
             "#include <string.h>",
             "#include <stdint.h>",
             "#include <time.h>",
             "#if defined(__ARM_FEATURE_SVE)",
             "#include <arm_sve.h>",
             "#endif"]
    parts += _runtime_utils()
    for k in kernels:
        kn = rname(k["kernel"])
        ret, params = k["ret"], k["params"]
        covers = k["cover_ids"]
        n = max(covers) + 1
        typ = "dynopt_%s_t" % kn
        parts += ["", "// kernel %s" % k["kernel"],
                  _typedef(ret, params, typ)]
        for cid in covers:
            parts.append(_decl_for(ret, params,
                                   cov_symbol(k["kernel"], cid)))
        init = ", ".join("0" if i == 0 else cov_symbol(k["kernel"], i)
                         for i in range(n))
        parts.append("static %s dynopt_%s_fns[%d] = {%s};" % (typ, kn, n, init))
        parts.append("static %s dynopt_%s_up = 0;" % (typ, kn))
        dflt = k["default_id"] if k["default_id"] in covers else min(covers)
        parts.append("static %s dynopt_%s_cur = dynopt_%s_fns[%d];"
                     % (typ, kn, kn, dflt))
        parts.append("static void %s(%s) { if (dynopt_%s_cur) "
                     "dynopt_%s_cur(%s); }"
                     % (trampoline(k["kernel"]), _arg_defs(params),
                        kn, kn, _arg_call(params)))
        parts.append("static int dynopt_%s_sel(int ord) {" % kn)
        parts.append("    if (ord < 0 || ord >= %d) return -1;" % n)
        parts.append("    if (ord == 0) return dynopt_%s_up ? 0 : -1;" % kn)
        parts.append("    if (!dynopt_%s_fns[ord]) return -1;" % kn)
        parts.append("    return ord;")
        parts.append("}")
        parts.append("static int dynopt_%s_apply(int ord) {" % kn)
        parts.append("    int id = dynopt_%s_sel(ord);" % kn)
        parts.append("    if (id < 0) return -1;")
        parts.append("    dynopt_%s_cur = (id == 0) ? dynopt_%s_up : "
                     "dynopt_%s_fns[id];" % (kn, kn, kn))
        parts.append("    return 0;")
        parts.append("}")
        if k["kernel"] in bench_kernels:
            parts += _bench_block(k, _bench_spec(k["kernel"]))

    lines = ["",
             "static int dynopt_select_kernel(const char* k, int ord) {"]
    for k in kernels:
        lines.append("    if (!strcmp(k, \"%s\")) return dynopt_%s_apply(ord);"
                     % (k["kernel"], rname(k["kernel"])))
    lines += ["    return -1;",
              "}",
              "static void dynopt_select_defaults(void) {"]
    for k in kernels:
        kn = rname(k["kernel"])
        dflt = k["default_id"] if k["default_id"] in k["cover_ids"] \
            else min(k["cover_ids"])
        lines.append("    dynopt_%s_cur = dynopt_%s_fns[%d];" % (kn, kn, dflt))
    lines += ["}",
              "static void dynopt_bench_all(void) {",
              "    uint64_t budget_ns = 4000000000ULL;",
              "    { const char* bm = getenv(\"AGO_BENCH_BUDGET_MS\");",
              "      if (bm && atoll(bm) > 0) budget_ns = (uint64_t)atoll(bm) * 1000000ULL; }",
              "    uint64_t t0_all = dynopt_cnt();",
              "    char fp[16]; dynopt_host_fp(fp, sizeof(fp));",
              "    char preset[2048];",
              "    int off = snprintf(preset, sizeof(preset), "
              "\"AGO_PRESET=%s:\", fp);",
              "    if (getenv(\"AGO_DEBUG\")) fprintf(stderr, \"dynopt: dbg fp=%s off=%d\\n\", fp, off);",
              "    int first = 1;",
              "    int stop = 0;"]
    for k in kernels:
        if k["kernel"] not in bench_kernels:
            continue
        kn = rname(k["kernel"])
        lines.append("    if (dynopt_cnt() - t0_all >= budget_ns) {")
        lines.append("        if (!stop) fprintf(stderr, \"dynopt: bench budget exhausted,"
                     " skipping remaining kernels\\n\");")
        lines.append("        stop = 1;")
        lines.append("    }")
        lines.append("    if (!stop) { if (getenv(\"AGO_DEBUG\")) fprintf(stderr, \"dynopt: dbg before bench %s\\n\");" % k["kernel"])
        lines.append("      int b = (int)dynopt_%s_bench();" % kn)
        lines.append("      if (getenv(\"AGO_DEBUG\")) fprintf(stderr, \"dynopt: dbg after bench %s b=%%d\\n\", b);" % k["kernel"])
        lines.append("      if (b >= 0) {")
        lines.append(f'        off += snprintf(preset + off, sizeof(preset) - off, '
                     f'"%s%s=%d", first ? "" : ",", "{k["kernel"]}", b);')
        lines.append("        first = 0; }")
        lines.append("    }")
    lines += [
        "    if (getenv(\"AGO_DEBUG\")) fprintf(stderr, \"dynopt: dbg after snprintf off=%d\\n\", off);",
        "    fprintf(stdout, \"%s\\n\", preset);",
        "    if (getenv(\"AGO_DEBUG\")) fprintf(stderr, \"dynopt: dbg after fprintf\\n\");",
        "}",
        "extern \"C\" void dynopt_preset_and_bench(void) {",
        "    char hostfp[16]; dynopt_host_fp(hostfp, sizeof(hostfp));",
        "    const char* p = getenv(\"AGO_PRESET\");",
        "    if (p && *p) {",
        "        char buf[1024]; snprintf(buf, sizeof(buf), \"%s\", p);",
        "        char* save1 = 0;",
        "        char* v = strtok_r(buf, \":\", &save1);",
        "        if (!v || strcmp(v, \"v1\")) {",
        "            fprintf(stderr, \"dynopt: AGO_PRESET ignored (bad version)\\n\");",
        "        } else {",
        "            char* fp = strtok_r(0, \":\", &save1);",
        "            if (!dynopt_fp_ok(fp)) {",
        "                fprintf(stderr, \"dynopt: AGO_PRESET ignored (bad fingerprint)\\n\");",
        "            } else if (strcmp(fp, hostfp)) {",
        "                fprintf(stderr, \"dynopt: AGO_PRESET ignored (fingerprint mismatch: preset=%s host=%s)\\n\", fp, hostfp);",
        "            } else {",
        "                char* kvs = strtok_r(0, \":\", &save1);",
        "                if (!kvs || !*kvs) {",
        "                    fprintf(stderr, \"dynopt: AGO_PRESET ignored (empty choices)\\n\");",
        "                } else {",
        "                    char ks[64][64]; int os[64]; int nt = 0; int bad = 0;",
        "                    char* save2 = 0;",
        "                    for (char* t = strtok_r(kvs, \",\", &save2); t && nt < 64;",
        "                         t = strtok_r(0, \",\", &save2)) {",
        "                        char* eq = strchr(t, '=');",
        "                        if (!eq || eq == t || !dynopt_ord_ok(eq + 1)) {",
        "                            fprintf(stderr, \"dynopt: AGO_PRESET ignored (bad choices token: %s)\\n\", t);",
        "                            bad = 1; break;",
        "                        }",
        "                        *eq = 0;",
        "                        snprintf(ks[nt], sizeof(ks[nt]), \"%s\", t);",
        "                        os[nt] = atoi(eq + 1); nt++;",
        "                    }",
        "                    if (!bad)",
        "                        for (int i = 0; i < nt; i++)",
        "                            if (dynopt_select_kernel(ks[i], os[i]) < 0) {",
        "                                fprintf(stderr, \"dynopt: AGO_PRESET ignored (out of whitelist: %s=%d)\\n\", ks[i], os[i]);",
        "                                bad = 1; break;",
        "                            }",
        "                    if (bad) dynopt_select_defaults();",
        "                    else {",
        "                        for (int i = 0; i < nt; i++) dynopt_select_kernel(ks[i], os[i]);",
        "                        fprintf(stderr, \"dynopt: AGO_PRESET applied (%d kernels)\\n\", nt);",
        "                    }",
        "                }",
        "            }",
        "        }",
        "    }",
        "    const char* b = getenv(\"AGO_BENCH\");",
        "    if (b && !strcmp(b, \"1\")) {",
        "        if (!dynopt_intercepted_)",
        "            fprintf(stderr, \"dynopt: BENCH INVALID (interception failed)\\n\");",
        "        else",
        "            dynopt_bench_all();",
        "    }",
        "}",
    ]
    parts += lines
    return "\n".join(parts) + "\n"

import json, random, sys
# Debug interpreter for the structured block-DAG MachineIR (docs/42 G2b).
# Used to prove the model is correct when the C gate mismatched; quick hack.


def v4(x): return [int(v) for v in x]
def wrap(v, bits):
    m=1<<bits
    v%=m
    return v-m if v>=m//2 else v

def smull(a,b): return v4([wrap(a[i]*b[i],32) for i in range(4)])
def add(a,b): return v4([wrap(a[i]+b[i],32) for i in range(4)])
def sub(a,b): return v4([wrap(a[i]-b[i],32) for i in range(4)])
def shl(a,n): return v4([wrap(a[i]<<n,32) for i in range(4)])
def sqrshrn(a,n):
    # vqrshrn_n_s32: (a + 2^(n-1)) >> n, saturate to s16
    out=[]
    for x in a:
        r=(x + (1<<(n-1)))>>n
        r=max(-32768,min(32767,r))
        out.append(r)
    return v4(out)
def zips(a,b):
    # vcombine(vzip1,vzip2): interleave 4-lane a,b -> 8 lanes
    return v4([a[0],b[0],a[1],b[1],a[2],b[2],a[3],b[3]])
def zipq(a,b):
    # 8-lane zip1
    return v4([a[0],b[0],a[1],b[1],a[2],b[2],a[3],b[3],a[4],b[4],a[5],b[5],a[6],b[6],a[7],b[7]])
def zipq2(a,b):
    return v4([a[4],b[4],a[5],b[5],a[6],b[6],a[7],b[7],a[0],b[0],a[1],b[1],a[2],b[2],a[3],b[3]])

def main():
    d=json.load(open(sys.argv[1]))
    blocks={n['label']:n for n in d['nodes']}
    entry=d['nodes'][0]['label']
    rng=random.Random(0xD16C2026)
    src=[(j*37+11)%511-255 for j in range(16*64+16)]
    dst=[0]*(16*64)
    stride=16
    env={'0':('src',0),'1':('dst',0),'2':stride}
    # linear exec over blocks via gotos
    cur=entry
    guard=0
    while cur is not None and guard<100000:
        guard+=1
        blk=blocks[cur]
        for dstn,ph in blk['phis'].items():
            # incoming chosen by predecessor: not tracked in this simple exec;
            # we track via edge assignments below (emulate assign_phis at jumps)
            pass
        for n in blk['body']:
            op=n['op']
            d_=n.get('dst')
            if op=='addr':
                import re
                m=re.match(r'getelementptr inbounds (?:nuw )?((?:i8|i16|i32|i64|\[\d+ x i\d+\])), ptr %([\w.]+), i64 ([%@\-\d]+)',n['rhs'])
                et=m.group(1); base=env[m.group(2)]; off=m.group(3)
                if off.startswith('%'): off=env[off[1:]]
                else: off=int(off)
                mult={'i8':1,'i16':2,'i32':4,'i64':8}.get(et) or (int(re.search(r'\[(\d+) x',et).group(1))*int(re.search(r'x i(\d+)',et).group(1))//8)
                env[d_]=(base[0], base[1]+off*mult) if base[0] in ('src','dst') else (base, off*mult)
            elif op=='load':
                pe=env[n['ptr']]
                if not isinstance(pe,tuple):
                    print('BAD ptr', n['ptr'], pe, 'node', n)
                    raise SystemExit
                name,off=pe
                idx=off//2
                env[d_]=v4(src[idx:idx+4])
            elif op=='sext':
                env[d_]=env[n['src']]
            elif op=='shl':
                if str(n.get('type','')).startswith('<'): env[d_]=shl(env[n['src'][0]],n['amt'])
                else: env[d_]=(env[n['src'][0]]<<n['amt'])
            elif op=='mul':
                env[d_]=(env[n['src'][0]]*n.get('const',1))
            elif op=='add':
                env[d_]=add(env[n['src'][0]],env[n['src'][1]])
            elif op=='sub':
                env[d_]=sub(env[n['src'][0]],env[n['src'][1]])
            elif op=='shuffle':
                mask=n['mask']; srcs=[env[s] for s in n['src']]
                if n['type']=='<8 x i16>' and len(srcs[0])==4:
                    env[d_]=zips(srcs[0],srcs[1])
                elif n['type']=='<8 x i16>' and mask==[0,8,1,9,2,10,3,11]:
                    env[d_]=zipq(srcs[0],srcs[1])
                elif n['type']=='<8 x i16>' and mask==[4,12,5,13,6,14,7,15]:
                    env[d_]=zipq2(srcs[0],srcs[1])
                elif n['type']=='<4 x i16>' and mask==[0,1,2,3]:
                    env[d_]=v4(srcs[0][:4])
                elif n['type']=='<4 x i16>' and mask==[4,5,6,7]:
                    env[d_]=v4(srcs[0][4:8])
                else: raise Exception('shuffle %s'%n)
            elif op=='bitcast':
                v=env[n['src']]
                if n.get('src_type')=='<4 x i16>':
                    env[d_]=(v[0]<<48)|(v[1]<<32)|(v[2]<<16)|v[3]
                else:
                    env[d_]=[(v[0]<<48)|(v[1]<<32)|(v[2]<<16)|v[3],
                             (v[4]<<48)|(v[5]<<32)|(v[6]<<16)|v[7]]
            elif op=='extractelement':
                v=env[n['src'][0]]
                env[d_]=v[n['index']]
            elif op=='icmp':
                env[d_]=(env[n['src'][0]]==n.get('const',0))
            elif op=='intrinsic':
                name=n['intrinsic']
                if name=='smull':
                    a=env[n['args'][0]['ref']]; b=n['args'][1]
                    bv=v4([b['imm']]*4) if 'imm' in b else env[b['ref']]
                    env[d_]=smull(a,bv)
                elif name=='sqrshrn':
                    env[d_]=sqrshrn(env[n['args'][0]['ref']],n['args'][1]['imm'])
                else: raise Exception(name)
            elif op=='alias':
                v=n['src']
                if str(v).startswith('%'): env[d_]=env[v[1:]]
                elif v in ('0','zeroinitializer'): env[d_]=[0,0,0,0]
                else: env[d_]=v4([int(v)]*4)
            elif op=='store':
                t=n['type']
                name,off=env[n['ptr']]
                vals=env[n['src']]
                for k,x in enumerate(vals):
                    dst[off//2+k]=wrap(x,16)
            else: raise Exception('op '+op)
        term=blk['term']
        if term is None or term['kind']=='ret': cur=None
        elif term['kind']=='jump':
            # assign target phis from this edge
            for dstn,ph in blocks[term['target']]['phis'].items():
                v=ph['incoming'].get(cur)
                if v is None: v=next(iter(ph['incoming'].values()))
                if str(v).startswith('%'): env[dstn]=env[v[1:]]
                elif v in ('0','zeroinitializer'): env[dstn]=[0,0,0,0]
                else: env[dstn]=v4([int(v)]*4)
            cur=term['target']
        else:
            cond=env[term['cond']]
            nxt=term['then'] if cond else term['else']
            for dstn,ph in blocks[nxt]['phis'].items():
                v=ph['incoming'].get(cur)
                if v is None: v=next(iter(ph['incoming'].values()))
                if str(v).startswith('%'): env[dstn]=env[v[1:]]
                elif v in ('0','zeroinitializer'): env[dstn]=[0,0,0,0]
                else: env[dstn]=v4([int(v)]*4)
            cur=nxt
        if cur=='38' and guard<20:
            for k in ('39','40','41','42','43','44','24','26'):
                print('I',k,'=',env.get(k))
    print('executed blocks',guard)
    print('out row0:', dst[:16])
    print('out row1:', dst[16:32])
    return 0
main()

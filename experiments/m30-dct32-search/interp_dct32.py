import json, sys, re
def wrap(v,bits):
    m=1<<bits; v%=m; return v-m if v>=m//2 else v
def main():
    d=json.load(open(sys.argv[1])); b=d['nodes'][0]
    src=[(j*37+11)%511-255 for j in range(32*96+16)]
    dst=[0]*(32*96); coef=[0]*1024
    env={}
    def get_ptr(n):
        # returns (kind, byte_off) kind in src/dst/coef
        m=re.match(r'getelementptr inbounds (?:nuw )?((?:i8|i16|i32|i64|\[\d+ x i\d+\])), ptr %([\w.]+), i64 ([%@\-\d]+)',n['rhs'])
        et=m.group(1); base=env[m.group(2)]; off=m.group(3)
        if off.startswith('%'): off=env[off[1:]]
        else: off=int(off)
        mult={'i8':1,'i16':2,'i32':4,'i64':8}.get(et) or (int(re.search(r'\[(\d+) x',et).group(1))*int(re.search(r'x i(\d+)',et).group(1))//8)
        return base[0], base[1]+off*mult
    env['0']=('src',0); env['1']=('dst',0); env['2']=32
    for n in b['body']:
        op=n['op']; dstn=n.get('dst')
        if op=='alloca': env[dstn]=('coef',0)
        elif op=='addr': env[dstn]=get_ptr(n)
        elif op=='load':
            kind,off=env[n['ptr']]
            arr=src if kind=='src' else coef
            env[dstn]=arr[off//2:off//2+4]
        elif op=='sext': env[dstn]=list(env[n['src']])
        elif op=='shl':
            if str(n.get('type','')).startswith('<'): env[dstn]=[wrap(x<<n['amt'],32) for x in env[n['src'][0]]]
            else: env[dstn]=env[n['src'][0]]<<n['amt']
        elif op=='mul':
            if str(n.get('type','')).startswith('<'):
                cv=n.get('const_vec')
                if cv: env[dstn]=[wrap(env[n['src'][0]][i]*cv[i],32) for i in range(4)]
                elif n.get('const') is not None: env[dstn]=[wrap(x*n['const'],32) for x in env[n['src'][0]]]
                else: env[dstn]=[wrap(env[n['src'][0]][i]*env[n['src'][1]][i],32) for i in range(4)]
            else: env[dstn]=env[n['src'][0]]*n.get('const',1)
        elif op in ('add','sub'):
            a=env[n['src'][0]]; bb=env[n['src'][1]]
            ln=len(a)
            bits=32 if ln==4 and isinstance(a[0],int) and abs(a[0])>100000 else (32 if ln==4 else 16)
            # dct32: <4 x i32> add/sub and <8 x i16> add/sub
            if n.get('type')=='<8 x i16>':
                env[dstn]=[wrap(a[i]+bb[i] if op=='add' else a[i]-bb[i],16) for i in range(ln)]
            else:
                env[dstn]=[wrap(a[i]+bb[i] if op=='add' else a[i]-bb[i],32) for i in range(ln)]
        elif op=='shuffle':
            mask=n['mask']; s0=env[n['src'][0]]
            if n['type']=='<4 x i16>' and mask==[0,1,2,3]: env[dstn]=s0[:4]
            elif n['type']=='<4 x i16>' and mask==[4,5,6,7]: env[dstn]=s0[4:8]
            elif n['type']=='<4 x i32>' and mask in ([3,2,1,0],[1,0,3,2]):
                env[dstn]=[s0[3],s0[2],s0[1],s0[0]] if mask==[3,2,1,0] else [s0[1],s0[0],s0[3],s0[2]]
            elif n['type']=='<8 x i16>' and mask==[7,6,5,4,3,2,1,0]:
                r=s0[::-1]; env[dstn]=r[:4]+[0]*4 if len(s0)==4 else r
            elif n['type']=='<4 x i32>' and mask==[0,1,4,5]:
                s1=env[n['src'][1]]
                env[dstn]=[s0[0],s0[1],s1[0],s1[1]]
            elif n['type']=='<4 x i32>' and mask==[2,3,6,7]:
                s1=env[n['src'][1]]
                env[dstn]=[s0[2],s0[3],s1[2],s1[3]]
            else: raise Exception('shuffle %s %s'%(n['type'],mask))
        elif op=='intrinsic':
            name=n['intrinsic']
            if name=='ld1x4':
                kind,off=env[n['args'][0]['ref']]
                arr=src if kind=='src' else coef
                base=off//2
                chunk = 8 if str(n.get('type','')).startswith('{ <8 x i16>') else 4
                env[dstn]=[arr[base+k*chunk:base+k*chunk+chunk] for k in range(4)]
            elif name=='smull':
                a0=n['args'][0]; a1=n['args'][1]
                av=a0.get('imm_vec') or env.get(a0.get('ref'))
                if 'imm_vec' in a1: bb=a1['imm_vec']
                elif 'imm' in a1: bb=[a1['imm']]*4
                else: bb=env[a1['ref']]
                env[dstn]=[wrap(av[i]*bb[i],32) for i in range(4)]
            elif name=='addp':
                a=env[n['args'][0]['ref']]; bb=env[n['args'][1]['ref']]
                    print('interp 84/82:', env.get('84'), env.get('82'), '169/167:', env.get('169'), env.get('167'))
                if n.get('type')=='<4 x i32>':
                    env[dstn]=[wrap(a[0]+a[1],32),wrap(a[2]+a[3],32),wrap(bb[0]+bb[1],32),wrap(bb[2]+bb[3],32)]
                else:
                    env[dstn]=[wrap(a[0]+a[1],16),wrap(a[2]+a[3],16),wrap(bb[0]+bb[1],16),wrap(bb[2]+bb[3],16)]
            elif name=='rshrn':
                a=env[n['args'][0]['ref']]; imm=n['args'][1]['imm']
                env[dstn]=[wrap((x+(1<<(imm-1)))>>imm,16) for x in a]
                if dstn=='7090': print('interp 7090:', env[dstn])
            else: raise Exception('intrinsic '+name)
        elif op=='extractvalue':
            env[dstn]=env[n['src'][0]][n['index']]
        elif op=='store':
            kind,off=env[n['ptr']]
            vals=env[n['src']]
            if n.get('src')=='7092': print('interp coef0-store:', vals)
            arr=dst if kind=='dst' else coef
            for k,x in enumerate(vals):
                arr[off//2+k]=wrap(x,16)
        else: raise Exception('op '+op)
    print('coef0-1:', coef[:32])
    print('row0:', dst[:16])
    print('row1:', dst[32:48])
main()

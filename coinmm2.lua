return(function()local CRYPTEDlIIIIlIl = "lol you have to stop trying to deobfuscate";local CRYPTEDlIIIIlIl = "lol you have to stop trying to deobfuscate";local CRYPTEDlIIIIlIl = "lol you have to stop trying to deobfuscate";local CRYPTEDlIIllllI=47;local CRYPTEDlIIlllIl=298;local CRYPTEDlIIlllII=3;local CRYPTEDlIIlIllI=function(a)local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/';a=string.gsub(a,'[^'..b..'=]','')return a:gsub('.',function(c)if c=='='then return''end;local d,e='',b:find(c)-1;for f=6,1,-1 do d=d..(e%2^f-e%2^(f-1)>0 and'1'or'0')end;return d end):gsub('%d%d%d?%d?%d?%d?%d?%d?',function(c)if#c~=8 then return''end;local g=0;for f=1,8 do g=g+(c:sub(f,f)=='1'and 2^(8-f)or 0)end;return string.char(g)end)end;local CRYPTEDlIIlllIl=45;local CRYPTEDlIIlIlIl=(function()local function a(b)local c={}for d=0,255 do c[d]={}end;c[0][0]=b[1]*255;local e=1;for f=0,7 do for d=0,e-1 do for g=0,e-1 do local h=c[d][g]-b[1]*e;c[d][g+e]=h+b[2]*e;c[d+e][g]=h+b[3]*e;c[d+e][g+e]=h+b[4]*e end end;e=e*2 end;return c end;local i=a{0,1,1,0}local function j(self,k)local l,d,g=self.S,self.i,self.j;local m={}local n=string.char;for o=1,k do d=(d+1)%256;g=(g+l[d])%256;l[d],l[g]=l[g],l[d]m[o]=n(l[(l[d]+l[g])%256])end;self.i,self.j=d,g;return table.concat(m)end;local function p(self,q)local r=j(self,#q)local s={}local t=string.byte;local n=string.char;for d=1,#q do s[d]=n(i[t(q,d)][t(r,d)])end;return table.concat(s)end;local function u(self,v)local l=self.S;local g,w=0,#v;local t=string.byte;for d=0,255 do g=(g+l[d]+t(v,d%w+1))%256;l[d],l[g]=l[g],l[d]end end;function new(v)local l={}local s={S=l,i=0,j=0,generate=j,cipher=p,schedule=u}for d=0,255 do l[d]=d end;if v then s:schedule(v)end;return s end;return new end)();local fev=getfenv or function()return _ENV end;local CRYPTEDlIIlIlII=(function()local a=false;local b=string.unpack;local c=table.pack;local d=table.create;local e=table.move;local f=coroutine.create;local g=coroutine.yield;local h=coroutine.resume;local i=tonumber;local j=pcall;local function k()return{slist={},plist={}}end;local function l()return{code={},k={},protos={}}end;local m={{"NOP",0},{"BREAK",0},{"LOADNIL",1},{"LOADB",3},{"LOADN",4},{"LOADK",4},{"MOVE",2},{"GETGLOBAL",1,true},{"SETGLOBAL",1,true},{"GETUPVAL",2},{"SETUPVAL",2},{"CLOSEUPVALS",1},{"GETIMPORT",4,true},{"GETTABLE",3},{"SETTABLE",3},{"GETTABLEKS",3,true},{"SETTABLEKS",3,true},{"GETTABLEN",3},{"SETTABLEN",3},{"NEWCLOSURE",4},{"NAMECALL",3,true},{"CALL",3},{"RETURN",2},{"JUMP",4},{"JUMPBACK",4},{"JUMPIF",4},{"JUMPIFNOT",4},{"JUMPIFEQ",4,true},{"JUMPIFLE",4,true},{"JUMPIFLT",4,true},{"JUMPIFNOTEQ",4,true},{"JUMPIFNOTLE",4,true},{"JUMPIFNOTLT",4,true},{"ADD",3},{"SUB",3},{"MUL",3},{"DIV",3},{"MOD",3},{"POW",3},{"ADDK",3},{"SUBK",3},{"MULK",3},{"DIVK",3},{"MODK",3},{"POWK",3},{"AND",3},{"OR",3},{"ANDK",3},{"ORK",3},{"CONCAT",3},{"NOT",2},{"MINUS",2},{"LENGTH",2},{"NEWTABLE",2,true},{"DUPTABLE",4},{"SETLIST",3,true},{"FORNPREP",4},{"FORNLOOP",4},{"FORGLOOP",4,true},{"FORGPREP_INEXT",4},{"LOP_DEP_FORGLOOP_INEXT",0},{"FORGPREP_NEXT",4},{"LOP_DEP_FORGLOOP_NEXT",0},{"GETVARARGS",2},{"DUPCLOSURE",4},{"PREPVARARGS",1},{"LOADKX",1,true},{"JUMPX",5},{"FASTCALL",3},{"COVERAGE",5},{"CAPTURE",2},{"LOP_DEP_JUMPIFEQK",0},{"LOP_DEP_JUMPIFNOTEQK",0},{"FASTCALL1",3},{"FASTCALL2",3,true},{"FASTCALL2K",3,true},{"FORGPREP",4},{"JUMPXEQKNIL",4,true},{"JUMPXEQKB",4,true},{"JUMPXEQKN",4,true},{"JUMPXEQKS",4,true}}local n={}for a,b in next,m do if b[3]then table.insert(n,a)end end;local o=-1;local p=-2;local function q(a)local c=1;local d=k()local e=d.slist;local f=d.plist;local function g()local a=b(">B",a,c)c=c+1;return a end;local function h()local a=b("I4",a,c)c=c+4;return a end;local function i()local a=0;for b=0,7 do local c=g()a=bit32.bor(a,bit32.lshift(bit32.band(c,127),b*7))if bit32.band(c,128)==0 then break end end;return a end;local function j()local d=i()local e;if d==0 then return""else e=b("c"..d,a,c)c=c+d end;return e end;local function k(a)local b={}local c=h()local d=bit32.band(c,255)b.value=c;b.opcode=d;local e=m[d+1]b.opname=e[1]local e=e[2]b.type=e;local e=b.type;if e==3 then b.A=bit32.band(bit32.rshift(c,8),255)b.B=bit32.band(bit32.rshift(c,16),255)b.C=bit32.band(bit32.rshift(c,24),255)elseif e==2 then b.A=bit32.band(bit32.rshift(c,8),255)b.B=bit32.band(bit32.rshift(c,16),255)elseif e==1 then b.A=bit32.band(bit32.rshift(c,8),255)elseif e==4 then b.A=bit32.band(bit32.rshift(c,8),255)local a=bit32.band(bit32.rshift(c,16),65535)b.D=a<32768 and a or a-65536 elseif e==5 then local a=bit32.band(bit32.rshift(c,8),16777215)b.E=a<8388608 and a or a-16777216 end;if table.find(n,d+1)then local c=h()b.aux=c;table.insert(a,b)table.insert(a,{value=c})return true end;table.insert(a,b)return false end;local function m()local e=l()e.maxstacksize=g()e.numparams=g()e.nups=g()e.isvararg=g()~=0;local f=e.code;local j=i()e.sizecode=j;local l=false;for a=1,j do if l then l=false;continue end;l=k(f)end;local f=e.k;local k=i()e.sizek=k;for e=1,k do local e=g()local j;if e==0 then j=nil elseif e==1 then j=g()~=0 elseif e==2 then local a=b("d",a,c)c=c+8;j=a elseif e==3 then j=d.slist[i()]elseif e==4 then j=h()elseif e==5 then local a={}local b=i()for b=1,b do table.insert(a,i())end;j=a elseif e==6 then j=i()end;table.insert(f,j)end;local a=i()local b=e.protos;e.sizep=a;for a=1,a do table.insert(b,i())end;i()i()if g()~=0 then local a=g()for a=1,j do g()end;local a=bit32.rshift(j-1,a)+1;for a=1,a do h()end end;if g()~=0 then local a=i()for a=1,a do i()i()i()g()end end;return e end;local b=g()local b=i()for a=1,b do table.insert(e,j())end;local b=i()for a=1,b do table.insert(f,m())end;d.mainp=i()assert(c==#a+1,"Deserializer position mismatch")return d end;local function b(b,k)if type(b)=="string"then b=q(b)end;local l=b.plist;local m=l[b.mainp+1]local function n(b,m,q)local function r(a,j,r,r,s)local t,u,v,w=-1,1,{},{}local x=m.k;while true do local y=r[u]local z=y.opcode;u+=1;a.pc=u;a.name=y.opname;if z==2 then j[y.A]=nil elseif z==3 then j[y.A]=y.B~=0;u+=y.C elseif z==4 then j[y.A]=y.D elseif z==5 then j[y.A]=x[y.D+1]elseif z==6 then j[y.A]=j[y.B]elseif z==7 then u+=1;local a=x[aux+1]assert(type(a)=="string","GETGLOBAL encountered non-string constant!")j[y.A]=k[a]elseif z==8 then u+=1;local a=x[y.aux+1]assert(type(a)=="string","GETGLOBAL encountered non-string constant!")k[a]=j[y.A]elseif z==9 then local a=q[y.B+1]j[y.A]=a.store[a.index]elseif z==10 then local a=q[y.B+1]a.store[a.index]=j[y.A]elseif z==11 then for a,b in v do if b.index>=y.A then b.value=b.store[b.index]b.store=b;b.index="value"v[a]=nil end end elseif z==12 then u+=1;local a=y.aux;local b=bit32.rshift(a,30)local c=bit32.band(bit32.rshift(a,20),1023)if b==1 then j[y.A]=k[x[c+1]]elseif b==2 then local a=bit32.band(bit32.rshift(a,10),1023)j[y.A]=k[x[c+1]][x[a+1]]elseif b==3 then local b=bit32.band(bit32.rshift(a,10),1023)local a=bit32.band(bit32.rshift(a,0),1023)j[y.A]=k[x[c+1]][x[b+1]][x[a+1]]end elseif z==13 then j[y.A]=j[y.B][j[y.C]]elseif z==14 then j[y.B][j[y.C]]=j[y.A]elseif z==15 then u+=1;local a=x[y.aux+1]j[y.A]=j[y.B][a]elseif z==16 then u+=1;local a=x[y.aux+1]j[y.B][a]=j[y.A]elseif z==17 then j[y.A]=j[y.B][y.C]elseif z==18 then j[y.B][y.C]=j[y.A]elseif z==19 then local a=l[y.D+1]local c={}for a=1,a.nups do local b=r[u]local d=b.opcode;u+=1;assert(d==70,"Unhandled opcode passed to NEWCLOSURE")local d=b.A;if d==0 then local b={value=j[b.B],index="value"}b.store=b;c[a]=b elseif d==1 then local b=b.B;local d=v[b]if d==nil then d={index=b,store=j}v[b]=d end;c[a]=d elseif d==2 then c[a]=q[b.B]end end;j[y.A]=n(b,a,c)elseif z==20 then u+=1;local a=y.A;local b=y.B;local c=x[y.aux+1]assert(type(c)=="string","NAMECALL encountered non-string constant!")j[a+1]=j[b]j[a]=j[b][c]elseif z==21 then local a,b,d=y.A,y.B,y.C;local b=b==0 and t-a or b-1;local b=c(j[a](table.unpack(j,a+1,a+b)))local c=b.n;if d==0 then t=a+c-1 else c=d-1 end;e(b,1,c,a,j)elseif z==22 then local a=y.A;local b=y.B;local c=b-1;local d;if c==o then d=t-a+1 else d=a+b-1-m.numparams end;return table.unpack(j,a,a+d-1)elseif z==23 then u+=y.D elseif z==24 then u+=y.D elseif z==25 then if j[y.A]then u+=y.D end elseif z==26 then if not j[y.A]then u+=y.D end elseif z==27 then if j[y.A]==j[y.aux]then u+=y.D else u+=1 end elseif z==28 then if j[y.A]<j[y.aux]then u+=y.D else u+=1 end elseif z==29 then if j[y.A]<=j[y.aux]then u+=y.D else u+=1 end elseif z==30 then if j[y.A]==j[y.aux]then u+=1 else u+=y.D end elseif z==31 then if j[y.A]<j[y.aux]then u+=1 else u+=y.D end elseif z==32 then if j[y.A]<=j[y.aux]then u+=1 else u+=y.D end elseif z==33 then j[y.A]=j[y.B]+j[y.C]elseif z==34 then j[y.A]=j[y.B]-j[y.C]elseif z==35 then j[y.A]=j[y.B]*j[y.C]elseif z==36 then j[y.A]=j[y.B]/j[y.C]elseif z==37 then j[y.A]=j[y.B]%j[y.C]elseif z==38 then j[y.A]=j[y.B]^j[y.C]elseif z==39 then j[y.A]=j[y.B]+x[y.C+1]elseif z==40 then j[y.A]=j[y.B]-x[y.C+1]elseif z==41 then j[y.A]=j[y.B]*x[y.C+1]elseif z==42 then j[y.A]=j[y.B]/x[y.C+1]elseif z==43 then j[y.A]=j[y.B]%x[y.C+1]elseif z==44 then j[y.A]=j[y.B]^x[y.C+1]elseif z==45 then local a=j[y.B]if not not a==false then j[y.A]=a else j[y.A]=j[y.C]or false end elseif z==46 then local a=j[y.B]if not not a==true then j[y.A]=a else j[y.A]=j[y.C]or false end elseif z==47 then local a=j[y.B]if not not a==false then j[y.A]=a else j[y.A]=x[y.C+1]or false end elseif z==48 then local a=j[y.B]if not not a==true then j[y.A]=a else j[y.A]=x[y.C+1]or false end elseif z==49 then local a=""for b=y.B,y.C do a..=j[b]end;j[y.A]=a elseif z==50 then j[y.A]=not j[y.B]elseif z==51 then j[y.A]=-j[y.B]elseif z==52 then j[y.A]=#j[y.B]elseif z==53 then u+=1;j[y.A]=d(y.aux)elseif z==54 then local a=x[y.D+1]local b={}for a,a in a do b[x[a+1]]=nil end;j[y.A]=b elseif z==55 then u+=1;local a=y.A;local b=y.B;local c=y.C-1;if c==o then c=t-b end;e(j,b,b+c,y.aux,j[a])elseif z==56 then local a=y.A;local b=j[a]if type(b)~="number"then local c=i(b)if c==nil then error("invalid 'for' limit (number expected)")end;j[a]=c;b=c end;local c=j[a+1]if type(c)~="number"then local b=i(c)if b==nil then error("invalid 'for' step (number expected)")end;j[a+1]=b;c=b end;local d=j[a+2]if type(d)~="number"then local b=i(d)if b==nil then error("invalid 'for' index (number expected)")end;j[a+2]=b;d=b end;local a=false;if c==math.abs(c)then a=d>=b else a=d<=b end;if a then u+=y.D end elseif z==57 then local a=y.A;local b=j[a]local c=j[a+1]local d=j[a+2]+c;local e=false;if c==math.abs(c)then e=d<=b else e=d>=b end;if e then j[a+2]=d;u+=y.D end elseif z==58 then local a=y.A;local b=y.aux;t=a+6;local c=j[a]if type(c)=="function"then local c={j[a](j[a+1],j[a+2])}e(c,1,b,a+3,j)if j[a+3]~=nil then j[a+2]=j[a+3]u+=y.D else u+=1 end else local c,c=h(w[y])if c==p then u+=1 else e(c,1,b,a+3,j)j[a+2]=j[a+3]u+=y.D end end elseif z==59 then if type(j[y.A])~="function"then error("FORGPREP_INEXT encountered non-function value")end;u+=y.D elseif z==61 then if type(j[y.A])~="function"then error("FORGPREP_NEXT encountered non-function value")end;u+=y.D elseif z==63 then local a=y.A;local b=y.B-1;if b==o then b=s.len;t=a+b-1 end;e(s.list,1,b,a,j)elseif z==64 then local a=l[x[y.D+1]+1]local c={}for a=1,a.nups do local b=r[u]local d=b.opcode;u+=1;assert(d==70,"Unhandled opcode passed to DUPCLOSURE")local d=b.A;if d==0 then local b={value=j[b.B],index="value"}b.store=b;c[a]=b elseif d==2 then c[a]=q[b.B]end end;j[y.A]=n(b,a,c)elseif z==65 then elseif z==66 then u+=1;local a=x[y.aux+1]assert(type(a)=="string","LOADKX encountered non-string constant!")j[y.A]=a elseif z==67 then u+=y.E elseif z==68 then elseif z==70 then error("Unhandled CAPTURE")elseif z==73 then elseif z==74 then u+=1 elseif z==75 then u+=1 elseif z==76 then local a=j[y.A]if type(a)~="function"then local b=r[u+y.D]if w[b]==nil then local function c()for a,b,c,d,e,f,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,ab,bb,cb,db,eb,fb,gb,hb,ib,jb,kb,lb,mb,nb,ob,pb,qb,rb,sb,tb,ub,vb,wb,xb,yb,zb,Ab,Bb,Cb,Db,Eb,Fb,Gb,Hb,Ib,Jb,Kb,Lb,Mb,Nb,Ob,Pb,Qb,Rb,Sb,Tb,Ub,Vb,Wb,Xb,Yb,Zb,ac,bc,cc,dc,ec,fc,gc,hc,ic,jc,kc,lc,mc,nc,oc,pc,qc,rc,sc,tc,uc,vc,wc,xc,yc,zc,Ac,Bc,Cc,Dc,Ec,Fc,Gc,Hc,Ic,Jc,Kc,Lc,Mc,Nc,Oc,Pc,Qc,Rc,Sc,Tc,Uc,Vc,Wc,Xc,Yc,Zc,ad,bd,cd,dd,ed,fd,gd,hd,id,jd,kd,ld,md,nd,od,pd,qd,rd,sd,td,ud,vd,wd,xd,yd,zd,Ad,Bd,Cd,Dd,Ed,Fd,Gd,Hd,Id,Jd,Kd,Ld,Md,Nd,Od,Pd,Qd,Rd,Sd in a do g({a,b,c,d,e,f,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,ab,bb,cb,db,eb,fb,gb,hb,ib,jb,kb,lb,mb,nb,ob,pb,qb,rb,sb,tb,ub,vb,wb,xb,yb,zb,Ab,Bb,Cb,Db,Eb,Fb,Gb,Hb,Ib,Jb,Kb,Lb,Mb,Nb,Ob,Pb,Qb,Rb,Sb,Tb,Ub,Vb,Wb,Xb,Yb,Zb,ac,bc,cc,dc,ec,fc,gc,hc,ic,jc,kc,lc,mc,nc,oc,pc,qc,rc,sc,tc,uc,vc,wc,xc,yc,zc,Ac,Bc,Cc,Dc,Ec,Fc,Gc,Hc,Ic,Jc,Kc,Lc,Mc,Nc,Oc,Pc,Qc,Rc,Sc,Tc,Uc,Vc,Wc,Xc,Yc,Zc,ad,bd,cd,dd,ed,fd,gd,hd,id,jd,kd,ld,md,nd,od,pd,qd,rd,sd,td,ud,vd,wd,xd,yd,zd,Ad,Bd,Cd,Dd,Ed,Fd,Gd,Hd,Id,Jd,Kd,Ld,Md,Nd,Od,Pd,Qd,Rd,Sd})end;g(p)end;w[b]=f(c)end end;u+=y.D elseif z==77 then if(j[y.A]==nil and 0 or 1)==bit32.rshift(y.aux,31)then u+=y.D else u+=1 end elseif z==78 then local a=y.aux;if((j[y.A]and 0 or 1)==(bit32.band(a,1)and 0 or 1))==bit32.rshift(a,31)then u+=y.D else u+=1 end elseif z==79 then local a=y.aux;local b=x[bit32.band(a,16777215)+1]assert(type(b)=="number","JUMPXEQKN encountered non-number constant!")local c=j[y.A]if bit32.rshift(a,31)==0 then u+=c==b and y.D or 1 else u+=c~=b and y.D or 1 end elseif z==80 then local a=y.aux;local b=x[bit32.band(a,16777215)+1]assert(type(b)=="string","JUMPXEQKS encountered non-string constant!")if((b==j[y.A])and 0 or 1)~=bit32.rshift(a,31)then u+=y.D else u+=1 end else error("Unsupported Opcode: "..y.opname.." op: "..z)end end end;local function b(...)local b=c(...)local d=d(m.maxstacksize)local f={len=0,list={}}e(b,1,m.numparams,0,d)if m.numparams<b.n then local a=m.numparams+1;local c=b.n-m.numparams;f.len=c;e(b,a,a+c-1,1,f.list)end;local b={}local e;if not a then e=c(j(r,b,d,m.protos,m.code,f))else e=c(true,r(b,d,m.protos,m.code,f))end;if e[1]then return table.unpack(e,2,e.n)else error(string.format("Fiu VM Error PC: %s Opcode: %s: \n%s",b.pc,b.name,e[2]),0)end end;return b end;return n(b,m)end;local rrr={luau_load=b,luau_newproto=l,luau_newmodule=k,luau_deserialize=q};return rrr.luau_load;end)();local CRYPTEDlIIllIll='\101\108\73\57\77\88\78\110\76\49\115\108\85\81\61\61';local CRYPTEDlIIlIIIl="\110\57\113\76\99\83\47\113\83\84\79\50\97\82\86\70\108\65\78\118\97\79\78\57\77\48\71\114\86\81\100\81\83\71\116\115\122\88\87\81\104\87\113\72\69\80\71\74\110\78\85\67\105\86\71\71\110\50\107\117\83\121\121\72\56\83\50\75\68\50\84\103\49\103\108\98\98\101\90\122\66\68\56\101\47\98\101\76\66\114\86\76\75\117\55\75\67\51\54\71\98\83\103\74\102\81\78\72\89\74\51\122\112\79\43\67\73\66\104\105\106\105\49\106\76\88\72\122\114\99\73\102\106\76\55\105\105\83\109\86\78\102\85\120\87\73\54\77\52\82\74\98\115\120\99\51\75\50\53\50\101\118\108\105\103\106\112\70\114\72\111\80\52\83\99\105\90\100\113\82\73\118\102\49\48\103\107\86\119\73\47\54\56\102\82\68\104\49\78\70\75\49\72\76\117\112\71\109\70\71\82\48\117\98\73\103\103\99\110\88\121\116\108\85\102\70\87\78\69\70\69\65\97\85\122\47\66\47\72\85\97\68\69\105\116\82\105\106\48\78\49\90\50\85\85\110\87\43\77\107\67\77\88\120\66\82\52\102\82\68\122\105\50\66\113\119\119\111\102\71\119\67\70\89\106\75\47\86\112\47\113\86\57\88\82\102\97\103\98\102\117\54\121\51\71\55\43\87\47\86\76\79\48\86\99\57\66\81\106\68\50\53\107\101\51\82\98\88\86\121\78\109\70\81\111\85\73\109\107\86\108\85\74\70\57\103\81\47\69\65\87\82\67\99\99\73\117\69\101\52\68\85\97\66\89\73\113\53\103\87\88\119\65\89\51\105\100\67\70\101\87\72\80\77\53\75\86\87\119\53\48\68\78\43\106\87\65\81\110\98\52\70\57\85\74\103\48\50\79\73\85\105\79\103\71\84\106\83\49\98\87\79\120\104\89\110\47\119\49\49\108\116\87\99\43\103\52\120\47\73\113\84\104\47\115\114\119\48\65\73\111\66\82\82\108\53\84\49\73\99\55\116\82\76\48\66\106\69\68\98\83\112\51\48\49\85\112\88\83\79\110\65\118\117\103\57\114\108\119\113\82\77\117\67\48\107\67\114\113\108\118\66\66\53\121\74\57\50\100\105\80\103\47\49\107\113\74\51\89\98\98\47\105\101\51\53\84\100\105\120\72\73\51\81\47\48\122\121\73\48\56\82\53\86\110\106\116\98\56\78\110\114\56\50\112\120\100\50\102\81\100\111\98\86\87\104\56\73\101\116\116\65\115\65\67\49\80\90\48\90\80\74\88\56\66\102\69\74\97\47\84\81\71\113\122\114\48\87\107\72\107\121\54\78\48\74\110\85\82\54\50\78\120\71\53\107\109\75\118\79\71\111\83\76\119\122\115\71\73\76\115\74\106\87\121\100\97\57\99\106\112\72\56\105\111\122\65\107\90\122\108\77\113\66\43\97\107\55\51\110\71\80\117\75\74\47\66\54\111\74\97\119\101\74\43\101\102\72\56\101\98\76\108\85\108\105\53\43\100\114\115\75\75\87\117\87\88\97\53\77\119\109\76\86\118\119\102\90\118\104\122\79\56\85\68\89\72\76\86\56\71\51\83\74\97\110\107\68\69\53\53\74\51\84\118\121\116\108\79\87\107\88\117\57\82\113\83\66\65\53\88\81\71\67\106\83\76\118\84\84\89\110\74\111\97\105\43\79\52\105\117\114\87\47\88\68\70\82\84\108\102\86\115\110\81\72\112\50\117\70\103\65\54\102\73\51\67\69\69\70\80\66\110\69\106\115\65\50\53\122\120\68\72\48\70\106\98\83\106\102\77\85\86\68\67\57\113\97\74\104\48\75\118\56\112\43\115\72\107\116\110\88\117\43\116\83\99\76\107\55\100\113\69\72\118\50\101\101\69\75\79\90\114\75\102\47\105\106\72\68\86\111\53\85\54\117\81\82\100\108\102\118\75\88\97\80\85\52\107\98\107\107\79\77\54\120\83\100\83\109\84\115\77\70\56\107\65\78\112\57\117\110\107\57\79\106\113\66\77\52\48\121\71\122\106\119\52\102\82\110\105\98\82\113\72\54\77\65\107\83\76\53\73\113\89\43\80\112\76\117\83\104\113\113\89\71\103\99\79\107\78\108\78\106\72\53\77\121\103\81\50\70\47\75\55\75\49\108\73\87\83\48\77\49\98\49\102\89\65\78\98\67\67\51\119\103\82\100\115\74\56\116\50\113\106\74\51\78\120\105\56\90\66\83\56\85\51\77\43\67\110\89\88\97\114\51\43\72\50\80\99\72\51\90\100\106\67\51\119\120\52\115\80\112\88\70\86\121\57\120\90\110\117\51\83\76\110\120\89\81\112\75\77\66\49\104\97\88\102\112\90\52\52\121\107\73\118\73\70\52\87\74\113\89\118\43\57\78\53\85\102\113\81\77\76\68\113\109\57\101\89\90\114\75\74\89\102\73\48\66\89\79\79\81\106\89\67\105\81\113\103\88\119\122\97\55\43\122\76\78\57\119\119\55\51\54\78\108\71\97\98\97\67\54\111\53\107\67\78\56\105\115\106\76\80\104\68\110\82\116\83\53\90\115\85\101\75\119\84\51\90\97\90\82\49\82\111\77\115\75\109\52\117\114\103\43\118\87\52\119\97\109\55\54\53\81\89\50\77\105\109\89\121\65\110\54\69\117\54\51\111\79\82\53\69\102\117\116\83\121\47\116\51\83\98\112\69\74\103\82\69\70\104\57\75\69\51\52\98\52\89\101\104\48\82\48\84\72\110\66\56\84\106\84\106\70\106\69\116\77\120\77\107\80\76\121\51\113\102\104\80\98\55\84\110\71\67\67\65\66\90\106\50\66\74\111\115\80\82\84\65\112\70\47\43\109\54\109\118\72\51\89\100\72\107\73\108\55\51\116\52\66\103\70\50\112\71\104\47\108\99\73\115\106\119\115\77\73\89\47\103\117\49\76\75\80\74\72\67\116\81\52\116\79\65\47\66\122\47\90\50\56\90\116\114\113\88\118\47\103\118\54\71\104\119\71\104\110\78\115\71\106\117\109\54\102\82\76\81\120\73\121\54\90\54\106\47\107\56\114\51\82\89\111\104\99\78\51\115\78\97\105\55\103\71\49\89\82\81\79\109\86\111\66\52\103\71\43\67\73\115\104\122\73\113\119\89\56\57\77\102\120\113\69\87\121\119\109\118\120\67\90\69\69\48\81\122\116\52\47\69\81\56\72\82\102\54\53\118\100\47\87\107\47\108\110\118\77\51\48\78\80\106\97\80\114\113\53\99\51\104\116\76\66\78\79\52\57\116\80\80\118\87\43\49\84\68\81\76\51\110\105\66\87\71\90\104\89\55\54\80\78\113\53\102\47\43\49\109\121\52\72\110\104\113\49\113\72\48\72\78\85\112\54\50\77\54\49\88\111\52\84\72\43\120\67\90\78\112\84\69\49\103\67\85\90\77\65\61\61";local CRYPTEDlIIllIII='cGdGMyktdmIsIzp7eE5xViI=';local CRYPTEDlIIllIIl='lol you have to stop trying to deobfuscate';local CRYPTEDlIIlIIlI=function(a,b)local c=CRYPTEDlIIlIlIl(CRYPTEDlIIlIllI(a))local d=c["\99\105\112\104\101\114"](c,CRYPTEDlIIlIllI(b))return CRYPTEDlIIlIllI(d)end;local CRYPTEDlIIllIIl='lol you have to stop trying to deobfuscate';local CRYPTEDlIIllIll='\101\108\73\57\77\88\78\110\76\49\115\108\85\81\61\61';local CRYPTEDlIIllIlI='QHZiQkloTlA+cEtBQWl3MDMzUA==';local CRYPTEDlIIlIIII='Oz8/NGtZYjtDaUkrRkErWloyOyNzUyVycTolSjNqJDQwaE4=bi12PyZmUDh0RiF1';function CRYPTEDlIIlIlll(a,b)local c=CRYPTEDlIIlIllI(a,b);local d=CRYPTEDlIIllIlI;return c,d end;return CRYPTEDlIIlIlII(CRYPTEDlIIlIIlI(CRYPTEDlIIllIll,CRYPTEDlIIlIIIl),fev(0))()end)()

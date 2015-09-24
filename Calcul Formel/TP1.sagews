︠0f4dc06a-6407-40a9-848a-6348de86f95a︠
###########################
# Premieres manipulations #
###########################

x=cos(pi/12)
x;
print(x)
x.show()

reset()
var ('x,y')
z = cos (x )^2 + sin (y )^2
print z. subs_expr (x== pi /2)
print z(y=pi /2)
z.show()

#############
# fonctions #
#############

reset ()
var ('x,y')
f(x,y) = x/ sin (x) + sqrt (y)
f
f. parent ()
f. show ()
f. limit (x =0). show ()
f. diff (x). show ()

################
# Arithmetique #
################

def euclid(x,y):
    u=max(x,y)
    v=min(x,y)
    while(v>0) :
        vv= (u%v)
        u = v
        v = vv
    return(u);

#euclid(15,5);

def Bezout(a,b):
    r=max(a,b)
    rr=min(a,b)
    u =1
    v=0
    uu=0
    vv=1
    while(rr>0):
        q = (r//rr)
        rs = r
        us = u
        vs = v
        r = rr
        u = uu
        v = vv
        rr = rs - q *rr
        uu = us - q*uu
        vv = vs - q*vv
    return(r,u,v)
#Bezout(135,15)

L=[1,2,3,4,5]
#L[0];
#L[2:4];
#prod(L);
#L[0:0];
#prod(L[0:0])
#L[2:len(L)-1]

def Chinois(A,N):
    n=min(len(A),len(N))
    P=prod(N)
    e=[]
    for j in range(0,n):
        x=P//(N[j])
        (d,u,v)=Bezout(x,N[j])
        e+=[u*x*A[j]]
    return(sum(e))

Chinois([2,3,2],[3,5,7])

#############
# Polynomes #
#############

R=QQ['x']
R
T=R.gen()
T.parent()
P=T^2+1
Q=T^3+2*T^2+1
Q//P
Bezout(Q,P)
(T-1)*Q+(-T^2-T+3)*P










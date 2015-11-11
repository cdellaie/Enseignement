︠6a800409-95d2-443b-9438-1bc5bcdc1d6fs︠
# Pivot de Gauss

A=ZZ
m=2
n=2
MS = MatrixSpace(A,m,n)

def T(i,j,x,n):
    if (i==j):
        return(matrix.identity(n))
    else :
        M=matrix.identity(n)
        M[i-1,j-1]=x
        return(M)

def exchange(i1,i,j1,j,B):
    N=B.nrows()
    M=B.ncols()
    L=T(i1,i,1,N)*T(i1,1,-1,N)*T(i1,i,1,N)
    R=T(j1,j,-1,M)*T(j,j1,1,M)*T(j1,j,-1,M)
    return(L*B*R)

def poids(n):
    j=0
    p=0
    P=Primes()
    while (P.unrank(j)<n+1):
        p+=valuation(n,P.unrank(j))
        j+=1
    return(p)

def minimal_weight(C,k):
    N=C.nrows()
    M=C.ncols()
    m=C[0,0]
    p=0
    q=0
    for i in range(k-1,N):
        for j in range(k-1,M):
            x=C[i,j]
            if (poids(x)<poids(m)):
                m=x
                p=i
                q=j
    return(p,q)

def minimal_weight2(C,k):
    N=C.nrows()
    m=C[k-1,k-1]
    p=0
    q=0
    for i in range(k-1,N):
        x=C[i,k-1]
        if (poids(x)<poids(m)):
                m=x
                p=i
                q=j
    return(p,q)

def Bezout(B,k):
    N=B.nrows()
    M=B.ncols()
    a=B[k-1,k-1]
    L=matrix.identity(N)
    for i in range(k,N):
        q=B[i,k-1]//a
        L= T(i+1,1,-q,N)*L
    return(L,L*B)

def non_echelon(B,k):
    N=B.nrows()
    ech=False
    for i in range(k,N):
        if (B[i,k-1]!=0):
            ech=True
    return(ech)

def etape1(B,k):
    N=B.nrows()
    M=B.ncols()
    BB=B
    while (non_echelon(BB,k)):
        (p,q)=minimal_weight2(BB,k)
        BB=exchange(k,p+1,k,q+1,BB)
        (L,BB)=Bezout(BB,k)
    return(BB)

def pivot(B):
    N=B.nrows()
    M=B.ncols()
    BB=B
    for k in range(0,N-1):
        (p,q)=minimal_weight(B,k+1)
        BB=exchange(k,p+1,k,q+1,BB)
        BB=etape1(BB,k)
        #print(str(k))
    return(BB)

# Tests numériques
print('Transvections 1,0')
T(1,0,2,2)
C=matrix(A,2,2,[10, 14 , 6, 7])
D=matrix(A,3,4,[9,1,4,7,6,2,5,8,12,4,8,10])
print('C=')
C
print('nrows(C)')
C.nrows()
print('echange C (2,2)')
exchange(1,2,1,2,C)
print('poids 7 et 8')
poids(7)
poids(8)
print('poids minimal de C ')
minimal_weight(C,1)
C[minimal_weight(C,1)]
print('Bezout')
Bezout(exchange(1,2,1,2,C),1)
#etape1(C,1)
print('D=')
D
print('de matrice echelon')
#etape1(D,1)
#etape1(etape1(D,1),2)
︡b4fc7e69-c2aa-4e8d-b4f9-8c2833ae92aa︡︡{"stdout":"Transvections 1,0\n","done":false}︡{"stdout":"[1 2]\n[0 1]","done":false}︡{"stdout":"\n","done":false}︡{"stdout":"C=\n","done":false}︡{"stdout":"[10 14]\n[ 6  7]\n","done":false}︡{"stdout":"nrows(C)\n","done":false}︡{"stdout":"2\n","done":false}︡{"stdout":"echange C (2,2)\n","done":false}︡{"stdout":"[ 28 -22]\n[  7  -6]\n","done":false}︡{"stdout":"poids 7 et 8\n","done":false}︡{"stdout":"1","done":false}︡{"stdout":"\n","done":false}︡{"stdout":"3\n","done":false}︡{"stdout":"poids minimal de C \n","done":false}︡{"stdout":"(1, 1)\n","done":false}︡{"stdout":"7\n","done":false}︡{"stdout":"Bezout\n","done":false}︡{"stdout":"([1 0]\n[0 1], [ 28 -22]\n[  7  -6])\n","done":false}︡{"stdout":"D=\n","done":false}︡{"stdout":"[ 9  1  4  7]\n[ 6  2  5  8]\n[12  4  8 10]\n","done":false}︡{"stdout":"de matrice echelon\n","done":false}︡{"done":true}
︠cff0ff2f-4263-48eb-abf7-d8c42a0de750s︠
def T(i,j,x,n):
    if (i==j):
        return(matrix.identity(n))
    else :
        M=matrix.identity(n)
        M[i-1,j-1]=x
        return(M)
    
def DE(x,k):
    N=x.nrows()
    m=abs(x[0,k])
    p=0
    y=x
    for i in range(1,N):
        if abs(x[i,k])<m:
            m=x[i,k]
            p=i
    for i in range(0,N):
        q=x[i,k]//x[p,k]
        y=T(i+1,p+1,-q,N)*y
    return(y)

def test(x,k):
    s=0
    p=0
    N=x.nrows()
    for i in range(0,N):
        if (x[i,k]!=0):
            s+=1
    if (s>1):
        return(False)
    else:
        return(True)

def etape(x,k):
    N=x.nrows()
    y=x
    while(test(y,k)==False):
        y=DE(y,k)
    p=0
    while (y[p,k]==0):
        p+=1
    L=T(1,p+1,1,N)*T(p+1,1,-1,N)*T(1,p+1,1,N)  
    return(L*y)

u=matrix(A,5,1,[ 2, 3,5,7,11])
print('u')
u
print('u échelonné')
etape(u,0)

v=matrix(A,5,1,[ 2, 4,10,14,22])
print('v')
v
print('v échelonné')
etape(v,0)


︡d6600514-8c5c-4520-a961-10c2d62297ea︡︡{"stdout":"u\n","done":false}︡{"stdout":"[ 2]\n[ 3]\n[ 5]\n[ 7]\n[11]\n","done":false}︡{"stdout":"u échelonné\n","done":false}︡{"stdout":"[1]\n[0]\n[0]\n[0]\n[0]\n","done":false}︡{"stdout":"v\n","done":false}︡{"stdout":"[ 2]\n[ 4]\n[10]\n[14]\n[22]\n","done":false}︡{"stdout":"v échelonné\n","done":false}︡{"stdout":"[2]\n[0]\n[0]\n[0]\n[0]\n","done":false}︡{"done":true}
︠aad1a096-1a94-43eb-bdf0-6e57e674c0ed︠











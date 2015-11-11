︠ac95a77e-ab24-490b-bd07-6e384891d334s︠
###################
#  Preliminaries  #
###################
clear()
def converter(binary): # converts a list of bits 0 and 1 into its value as a binary
    x=0
    y=binary
    j=0
    while(y>0):
        x += (2^j)*(y%10)
        y = y//10
        j+=1
    return(x)

def bits(m): # converts a number into its binary
    x=0
    y=m
    j=0
    while(y>0):
        x += (10^j)*(y%2)
        y = y//2
        j+=1
    return(x)

#########
## RSA ##
#########

#attach("TP.sagews")

def codeRSA(N,d,m):
    a=m^d
    return(a%N)

def decodeRSA(p,q,d,s):
    N=p*q
    phi=(p-1)*(q-1)
    (r,u,v)=xgcd(d,phi) # u d + v phi(N)= 1 i.e. u is the inverse of d mod phi(N)
    return((s^u)%N)

def RSA(p,q,d,NB,dB,m): #mysecretkey p,q ; mypublickey d ; Bob public key NB,dB ; the message m 
    m1=decodeRSA(p,q,d,m)
    return(codeRSA(NB,dB,m1))

################################################################
################################################################

#Exemple Alice private key (p,q,d)=(3,11,3), public key(33,3)

print("B wants to say 4")
print("B sends")
secret=codeRSA(33,3,4)
print(secret)
print("to A, and A reads")
decodeRSA(3,11,3,secret)
#
#Exemple 2 : A (3,11,3), B (5,9,3)
#
print("B wants to say 100101")
print("B sends")
m=converter(100101)
secret=RSA(5,9,3,3*11,3,m)
print(secret)
print("to A, and A reads")
mm=RSA(3,11,3,5*9,3,secret)
print(mm)
print("which corresponds to")
bits(mm)
︡e4d5e6e1-3c16-4369-9a2e-1ee4d872da3e︡{"stdout":"B wants to say 4\n"}︡{"stdout":"B sends\n"}︡{"stdout":"31\n"}︡{"stdout":"to A, and A reads\n"}︡{"stdout":"4\n"}︡{"stdout":"B wants to say 100101\n"}︡{"stdout":"B sends\n"}︡{"stdout":"7\n"}︡{"stdout":"to A, and A reads\n"}︡{"stdout":"37\n"}︡{"stdout":"which corresponds to\n"}︡{"stdout":"100101\n"}︡
︠969fbfa3-6d9f-48d8-a568-8adbf067fd6es︠
#############
##  Rabin  ##
#############


# Tonelli-Shanks
def test(p): # return a number which between 2 and p which is not a square mod p
    l=[0];
    for j in range(0,p):
        l+=[((j^2)%p)]
    b=2
    while (b in l):
        b+=1
    return(b)

def TS(p,a): #return square root of a mod p if p is an odd prime and a is a square mod p
    b=test(p)
    s=valuation(p-1,2)
    t=(p-1)//(2^s)
    z= b^t
    m=0
    for j in range(0,s):
        if (( pow((a^t)*(z^m),2^(s-1-j))+1) %p == 0):
            m += 2^j
    return( pow(a,(t+1)//2,p)*pow(z,m//2,p) )

def codeRabin(N,m):
    return((m^2)%N)

def decodeRabin(p,q,s):
    N=p*q
    rp = TS(p,s)
    rq = TS(q,s)
    (d,u,v)=xgcd(p,q) #Chinese remainder theorem
    ep = u*p
    eq = v*q
    R=int(rp)*eq+int(rq)*ep
    S=int(rp)*eq-int(rq)*ep
    return(R%N,-R%N,S%N,-S%N)

def Rabin(p,q,NB,m): #mysecretkey p,q ; mypublickey d ; Bob public key NB,dB ; the message m 
    m1=decodeRabin(p,q,m)
    return(codeRabin(NB,m1))

# Test de TS
x=TS(277,62111)
(x^2 -62111)%277
y=TS(331,62111)
(y^2 -62111)% 331

︡72728fa7-a5e3-46fd-98a8-9f90d084e32b︡{"stdout":"0\n"}︡{"stdout":"0\n"}︡
︠f2bfb71d-de9b-4617-9558-50ae5e4afd6es︠
# Exemple 3 : Rabin

print("B wants to say 1001111001111001 which is")
m=converter(1001111001111001)
print(m)
print("B sends")
secret=codeRabin(277*331,m)
print(secret)
print("to A, and A reads")
(a,b,c,d)=decodeRabin(277,331,secret)
print(a,b,c,d)
print("which in binary is")
bits(a)
bits(b)
bits(c)
bits(d)
print("The only message with redundancy is ") 
bits(b)

︡3126722e-4df5-41b6-92ed-5963156e913c︡{"stdout":"B wants to say 1001111001111001 which is\n"}︡{"stdout":"40569\n"}︡{"stdout":"B sends\n"}︡{"stdout":"62111\n"}︡{"stdout":"to A, and A reads\n"}︡{"stdout":"(51118, 40569, 22033, 69654)\n"}︡{"stdout":"which in binary is\n"}︡{"stdout":"1100011110101110\n"}︡{"stdout":"1001111001111001\n"}︡{"stdout":"101011000010001\n"}︡{"stdout":"10001000000010110\n"}︡{"stdout":"The only message with redundancy is \n"}︡{"stdout":"1001111001111001\n"}︡
︠11bef578-a152-42f8-b088-e454c3c8ae13︠










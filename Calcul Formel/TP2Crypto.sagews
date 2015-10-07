︠ac95a77e-ab24-490b-bd07-6e384891d334︠
###################
#  Preliminaries  #
###################

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
︡4424f8ed-e708-4c1d-9aac-b83e9e206a33︡{"stdout":"B wants to say 4\n"}︡{"stdout":"B sends\n"}︡{"stdout":"31\n"}︡{"stdout":"to A, and A reads\n"}︡{"stdout":"4\n"}︡{"stdout":"B wants to say 100101\n"}︡{"stdout":"B sends\n"}︡{"stdout":"7\n"}︡{"stdout":"to A, and A reads\n"}︡{"stdout":"37\n"}︡{"stdout":"which corresponds to\n"}︡{"stdout":"100101\n"}︡
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
        if (((((a^t) * (z^m) )^(2^(s-1-j)))%p) == -1):
            m += 2^j
    return((a^((t+1)//2)*(z^(m//2)))%p)

def codeRabin(N,m):
    return((m^2)%N)

def decodeRabin(p,q,s):
    N=p*q
    rp = TS(p,s)
    rq = TS(q,s)
    (d,u,v)=xgcd(p,q)
    ep = u*p
    eq = v*q
    R=rp*ep+rq*eq
    S=rp*ep-rq*eq
    return(R,N-R,S,N-S)

def Rabin(p,q,NB,m): #mysecretkey p,q ; mypublickey d ; Bob public key NB,dB ; the message m 
    m1=decodeRabin(p,q,m)
    return(codeRabin(NB,m1))

x=TS(277,62111)
(x^2 -62111)%277
y=TS(331,62111)
(y^2 -62111)% 331

︡32b3b2ff-3bef-49d0-a650-c05eeb64b7f1︡{"stdout":"151\n"}︡{"stdout":"0\n"}︡
︠f2bfb71d-de9b-4617-9558-50ae5e4afd6es︠
# Exemple 3 : Rabin

print("B wants to say 1001111001111001 which is")
m=converter(1001111001111001)
print(m)
print("B sends")
secret=codeRabin(277*331,m)
print(secret)
print("to A, and A reads")
decodeRabin(277,331,secret)
︡993491f5-68d3-4e05-a301-3520097c469f︡{"stdout":"B wants to say 1001111001111001 which is\n"}︡{"stdout":"40569\n"}︡{"stdout":"B sends\n"}︡{"stdout":"62111\n"}︡{"stdout":"to A, and A reads\n"}︡{"stdout":"(141, -141, 144, -144)\n"}︡
︠d8317d41-ae59-4ee0-bc8c-0ffdb58cff57s︠
69654
22033
40569
51118
︡41166691-bc6e-45a5-a9dc-7850b74e75f7︡{"stdout":"69654\n"}︡{"stdout":"22033\n"}︡{"stdout":"40569\n"}︡{"stdout":"51118\n"}︡
︠518d962b-7022-48e6-8d55-fb58ad48bebb︠










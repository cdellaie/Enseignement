##############################
# Calcul rapide de puissance #
##############################

def fastpower(a,n): #retourne a^n
    m=n
    y=1
    b=a
    while(m>1):
        if (m%2 == 0):
            b=b^2
            m=m//2
        else :
            y=y*b
            b=b^2
            m = m//2
    return(b*y)

#Verification avec la fonction pow de sage
# Remarque : pow(a,t,p) retourne rapidement a^t mod p

fastpower(13,55)
pow(13,55)
︡be007ed2-3039-482d-9ea0-ab7f372a9305︡{"stdout":"18487763498758903017821863604872883745551547783010632046513957\n"}︡{"stdout":"18487763498758903017821863604872883745551547783010632046513957\n"}︡
︠b910ece8-c498-4aac-b2c7-25a589a4fe6bs︠
######################
# Tests de primalité #
######################

#tester tous les nombres inférieurs à sqrt(n)

def naif(n):
    if (n==1):
        return(False)
    else :
        j=2
        prime=True
        x=sqrt(n)
        while((prime == True) and (j<x+1)):
            if (n%j ==0):
                prime=False
            j+=1
    return(prime)

naif(13569)
#naif(pow(2,31)-1)

#########################
## Tests de primalités ##
#########################

# Test de Fermat
import random

def Fermat(n,M):
    prime=True
    j=1
    while ((prime==True)and (j<M+1)):
        a=random.randint(1,n-1)
        j+=1
        if (((pow(a,n-1)-1)%n) != 0):
            prime=False
            print("Fermat : "+str(n)+" n'est pas premier.")
    if (prime==True):
        print("Fermat : "+str(n)+" est probablement premier.")


# import du package random : pour utiliser une fonction f de random, on doit évaluer random.f()

import random

# Test de Miller

def Miller(n,M):
    prime=True
    j=1
    s=valuation(n-1,2)
    t=(n-1)//(2^s)
    while((prime==True)and(j<M+1)):
        a = random.randint(1,n-1)
        j+=1
        if ((pow(a,t)-1)%n !=0):
            k=0
            while((prime==True)and(k<s)): #cette partie est fausse la condition doit etre verifiee pour tout k
                if (pow(a,(2^k)*t)+1 %n != 0):
                    prime = False
                    print("Miller : "+str(n)+" n'est pas premier.")
                k+=1
    if (prime==True):
        print("Miller : "+str(n)+" est probablement premier.")
    return(prime)

# Exemple sur le plus petit nombre de Carmichael 561

#Miller(561,10)

# Test de Solovay-Strassen

def SolovayStrassen(n,M):
    proba=1-(1/(2^M))
    if (n%2==0):
        return(True)
        print("2 est bien premier")
    else:
        prime=True
        j=1
        while((prime==True)and(j<M+1)):
            a = random.randint(1,n-1)
            j+=1
            if (((kronecker(a,n)-a^((n-1)//2))%n !=0)and(gcd(a,n)==1)):
                prime=False
                print("Solovay-Strassen : "+str(n)+" n'est pas premier")
        if (prime==True):
            print("Solovay-Strassen : "+str(n)+" est premier avec probabilité "+str(proba.n(digits=5))+" +/- "+str(10)+"^-5")
    return(prime)


Fermat(277,10)
Fermat(255,10)
Miller(561,10)
SolovayStrassen(97,100)
is_prime(277)
︡607c294c-20f7-403b-a20b-f4e284bdd16f︡{"stdout":"False\n"}︡{"stdout":"Fermat : 277 est probablement premier.\n"}︡{"stdout":"Fermat : 255 n'est pas premier.\n"}︡{"stdout":"Miller : 561 n'est pas premier.\nFalse\n"}︡{"stdout":"Solovay-Strassen : 97 est premier avec probabilité 1.0000 +/- 10^-5\nTrue\n"}︡{"stdout":"True\n"}︡
︠38798fec-289a-44ae-ac50-9a9799aaf1aa︠










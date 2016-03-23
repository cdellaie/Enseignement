//Modele d'Ising

N=4 // taille de la grille

// Creation d'une configuration quelconque, non admissible 

function X=random_config(N,p)
    U=2*grand(N,N,'unf',0,1)-1
    X=1*(U<-p)-1*(U>p)
endfunction

// Affichage d'une configuration

function Affichage(A)
    n=size(A)
    plot2d(0,0)
    plot2d(n(1)+1,n(2)+1)
    for i=1:n(1)
        for j=1:n(2)
            if A(i,j)==1 then
                plot2d(i,j,-4);
            elseif A(i,j)==-1
                plot2d(i,j,-5);
            end
        end
    end
endfunction

// Ajout d'un composant

function Y=Ajout(X,i,j,x)
    n=size(X)
    Y=X
    test=1
    if (i<n(1)) then
        test= test*(X(i+1,j)*x>-1);
    end
     if (i>1) then
        test= test*(X(i-1,j)*x>-1);
    end
     if (j<n(2)) then
        test= test*(X(i,j+1)*x>-1);
    end
     if (j>1) then
        test= test*(X(i,j-1)*x>-1);
    end
    
    if test==1 then
        Y(i,j)=x
    end
endfunction

// Chaine de Markov

function X=Simulation(M,N,q)
    X=zeros(N,N)
    p=1/(2*q+1)
    for k=1:M
        U=grand(1,1,'unf',-1,1)
        i=grand(1,1,'uin',1,N)
        j=grand(1,1,'uin',1,N)
        x=1*(U<-p)-1*(U>p)
        X=Ajout(X,i,j,x)
    end
endfunction

A=Simulation(1000,20,1)
Affichage(A)


///////////////////////////////////////////////////////////////
//               Modele d'Erhenfest modifie                  //
//  pour la circulation des pieces de monnaie dans Euroland  //
///////////////////////////////////////////////////////////////

// Parametres
Na=80;
Nb=80;

// Matrice de transition
function P=Euroland(na,nb)
    r=na/nb;
    u=r*(1-[0:(na-1)]./na).^2; // de i a i+1
    v=(1-[0:na]./na).*(1-r+2*r*[0:na]./na) // de i a i 
    w= ([1:na]./na).*(1-r+r*[1:na]./ na) // de i a i-1
    P=diag(u,1)+diag(v)+diag(w,-1)
endfunction

// Simulation
T=100000;
P=Euroland(Na,Nb)
X = grand(T, 'markov',P,1)
plot2d(1:T,X,2)

// k parmi n
function C = C(n)
    v = cumprod(1:n);
    C= prod(1:n) ./ (v .* gsort(v))
endfunction

// Probabilite invariante et
// Histogramme empirique

h=tabul(X)
pi= C(Na).^2
scf()
plot2d2(h(:,1),(1/T)*h(:,2),2)
plot2d([1:Na],(1/sum(pi))*pi)

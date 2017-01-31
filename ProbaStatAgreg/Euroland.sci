//////////////////////////////////////////////////////////////////////////////////////////
//  Modele d'Erhenfest modifie pour la circulation des pieces de monnaie dans Euroland  //
//////////////////////////////////////////////////////////////////////////////////////////

// Parametres
na=500;
nb=2500;
r=na/nb;

// Matrice de transition
u=r*(1-[0:(na-1)]./na).^2; // de i a i+1
v=(1-[0:na]./na).*(1-r+2*r*[0:na]./na) // de i a i 
w= ([1:na]./na).*(1-r+r*[1:na]./ na) // de i a i-1

P=diag(u,1)+diag(v)+diag(w,-1)

// Simulation
T=10000;
X = grand(T, 'markov',P,1)
plot2d(1:T,X,2)

// k parmi n
function C = C(n)
    v = cumprod(1:n);
    C= prod(1:n) ./ (v .* gsort(v))
endfunction

// ProbabilitÃ© invariante
 
n=3
(C(n)).^2 / (C(2*n))[n])

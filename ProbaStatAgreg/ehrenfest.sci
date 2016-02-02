//Entree de la matrice de transition de la chaine de Markov associee au modele d Ehrenfest

function P=ehrenfest(N)
d1=(N-(0:N-1))/N;
d2=(1:N)/N;
P=diag(d1,1)+diag(d2,-1);
endfunction;

// Simulation
m=1000
T=100000
x0=m
X=grand(T,'markov',ehrenfest(m),x0)
plot([1:T],X)

// Le systeme atteint l equilibre rapidement

//////////////////////
//                  //
//     Limites      //
//                  //
//////////////////////

N=500
m=10

// Loi normale, exponentielle, et de Cauchy

Z=grand(1,N,'nor',0,1)
W= grand(1,N,'exp',2)
U=rand(1,N)
Cauchy=30*tan($\%$ pi*(U-0.5))

// Loi des grands nombres

function esperance=esperance(X)
    [p,q]=size(X)
    scf()
    plot2d([1:q],cumsum(X)./[1:q],2)
    xtitle("Loi des grands nombres" )
endfunction

esperance(Z)
plot2d([0:N],0*[0:N])

\textbf{FDR empirique}

// Theoreme Central Limite
function plotFDR=plotFDR(X)
	[p,q]=size(X);
	scf()
 	plot2d2(-sort(-X),(1/q)*[1:q],2)
	xtitle("Fonction de repartition empirique")
endfunction

h=0.1;
t=[-5:h:5];

plotFDR(Z)
ynor=cdfnor("PQ",t,0*t,0*t+1)
plot2d(t,ynor)

plotFDR(W)
t=[0:h:5];
ypoi=cdfpoi("PQ",t,0*t+2)
plot2d(t,ypoi)

plotFDR(Cauchy)

//////////////////////////
//                      //
//  Chaines de Markov   //
//                      //
//////////////////////////

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

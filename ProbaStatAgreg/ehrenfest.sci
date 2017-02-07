// Modele d'Ehrenfest

//Entree de la matrice de transition de la chaine de Markov associee au modele d Ehrenfest

// Une pièce remplie de N particules, séparée en deux zones, A et B.
// A chaque instant, un particule, choisie au hasard de façon équiprobable parmi toutes les particules, change de zone.
// X_T = nombre de particules dans la zone A au temps T.

function P=ehrenfest(N)
d1=(N-(0:N-1))/N;
d2=(1:N)/N;
P=diag(d1,1)+diag(d2,-1);
endfunction;

// Simulation
m=1000
T=20000
x0=m
X=grand(T,'markov',ehrenfest(m),x0)
plot([1:T],X)
xtitle(' Ehrenfest : une trajectoire.')

// Le systeme atteint l equilibre rapidement
// Une illsutration du thm ergodique
t=tabul(X)
scf()
plot2d2(t(:,1),(1/T)*t(:,2),2)
plot2d2(0:m,binomial(0.5,m))
xtitle('Densité empirique pour Ehrenfest')


//Modele de Wright Fisger Sans mutations

// Une population de N individus, deux types génétiques , A et B
// A chaque génération, chaque individu choisit aléatoirement un unique parent de façon équiprobable parmi la génération 
// précédente, et hérite du type de son parent.
// X_T = nombre d'indvidu de type A à la date T

function Q=WF(N)
    Q=zeros(2*N+1,2*N+1)
    for i=(1:2*N+1)
        Q(i,:)=binomial((i-1)/(2*N),2*N)
    end
endfunction

//Parametres
m2=100 // taille de la population N=2*m2+1
T2=1000 // temps de simulation
x1=m2  // nombre d'individu de type A

// Une trajectoire

Y=grand(T2,'markov',WF(m2),x1)
scf()
plot([1:T2],Y)
xtitle('WrightFisher : une trajectoire.')

// Temps et probabilité de fixation

scf()
x=grand(T2,'markov',WF(m2),(m2/2+1)*ones(1,T2));

temps= sum(x>1&x<2*m2+1,'c')+1;//temps de fixation empirique
f0=sum(x(:,$)==1)/T2;//fréquence de fixation en 0
disp('Wright-Fisher : fréquence de fixation en 0: '+string(f0));
//xbasc();
histplot(m2,temps);
xtitle('WrightFisher : histogramme du temps de fixation')

N=10;
Y=zeros(2*N+1)
M=100;
for x=1:(2*N+1)
    s=0;
    for j=1:M
        Y=grand(T2,'markov',WF(N),x);
        temps= sum(x>1&x<2*m2+1,'c')+1;
        s=s+temps;
        Tau(x)=s/M
    end
end

scf()
plot2d2(1:(2*N+1),Tau)
xtitle("Temps de fixation en fonction du point de départ")
























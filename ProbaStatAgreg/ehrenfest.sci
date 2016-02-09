// Modele d'Ehrenfest

//Entree de la matrice de transition de la chaine de Markov associee au modele d Ehrenfest

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

// Le systeme atteint l equilibre rapidement
// Une illsutration du thm ergodique
t=tabul(X)
scf()
plot2d2(t(:,1),(1/T)*t(:,2),2)
plot2d2(0:m,binomial(0.5,m))
xtitle('Densité empirique')


//Modele de Wright Fisger Sans mutations

function Q=WF(N)
    Q=zeros(2*N+1,2*N+1)
    for i=(1:2*N+1)
        Q(i,:)=binomial((i-1)/(2*N),2*N)
    end
endfunction

m2=20
T2=200
x1=m2

// Une trajectoire

Y=grand(T2,'markov',WF(m2),x1)
scf()
plot([1:T2],Y)
xtitle('WrightFisher')

// Temps et probabilité de fixation
scf()
x=grand(T2,'markov',WF(m2),(m2/2+1)*ones(1,T2));
temps= sum(x>1&x<2*m2+1,'c')+1;//temps de fixation empiriques
f0=sum(x(:,$)==1)/T2;//fréquence de fixation en 0
disp('fréquence de fixation en 0: '+string(f0));
//xbasc();
histplot(m2,temps);




























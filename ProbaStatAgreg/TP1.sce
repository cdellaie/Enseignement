// TP1 : Introduction Probabiliste a Scilab

// Un peu de matrices pour s'échauffer
M=[1 3 5;-2 6 1]
ones(M);

// Générer de l'aléa 

plot2d(cumsum(rand(1,1000))./[1:1000])
plot2d([1:1000],cumsum(rand(1,1000))./[1:1000],4)
scf();
plot2d(cumsum(-log(rand(1,1000)))./[1:1000])
plot2d([1:1000]',cumsum(grand(1000,10,'nor',0,1),'r')./([1:1000]'*ones(1,10)))
histplot(100,grand(1,1000,'exp',2))
xtitle('Histogramme exponentielle')

// Loi forte des grands nombres

N=500
m=10
Z=grand(1,N,'nor',0,1)
W= grand(1,N,'exp',2)

U=rand(1,N)
Cauchy=30*tan(%pi*(U-0.5))

function esperance=esperance(X)
    [p,q]=size(X)
    scf()
    plot2d([1:q],cumsum(X)./[1:q],2)
    xtitle("Loi ds grands nombres" )
endfunction

esperance(Z)
plot2d([0:N],0*[0:N])


// Theoreme Central Limite
function plotFDR=plotFDR(X)
    [p,q]=size(X);
    scf()
    plot2d2(gsort(X,'g','i'),(1/q)*[1:q],2)
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

// Méthode de Monte-Carlo

U=grand(2,N,"unf",0,1)
R=U(1,:).^2+U(2,:).^2
CircleArea = 4*sum(1*(R<1))/N

function MC=MC(M)
    V=grand(2,M,"unf",0,1)
    RR=V(1,:).^2+V(2,:).^2
    Y=4*cumsum((1*(RR<1)))./[1:M]
    scf()
    plot2d([1:M],Y)
    xtitle("Monte Carlo")
endfunction

MC(1000)

//Méthode de rejets

function rejet=rejet() //simule par méthode de rejet la loi sin(pi*x)1*(0<x<1)dx
    X=zeros(1,10000)
    for i = 1:10000
        x=rand(1,2)
        while x(2)>sin(%pi*x(1))
            x=rand(1,2)
        end
        X(i)=x(1)
    end
    scf()
    histplot(100,X)
    Y=[0:0.05:1];
    plot2d(Y,%pi*sin(%pi*Y)/2)
endfunction

//Mélange de Lois

function melange=melange(X,Y,p)
    [1,q]=size(X)
    U=rand(1,q)
    melange=1*(U<p)*X+1*(U>p)*Y
endfunction

function BernoulliPoisson=BernoulliPoisson()
    N=grand(1,1,'poi',1)
    X=rand(1,N)
    BP=sum(X)
endfunction

BP=zeros(1,100);
for j=1:100
    BP(j)=BernoulliPoisson();
end

plotFDR(BP)










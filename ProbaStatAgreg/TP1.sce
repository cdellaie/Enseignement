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




















// Glivenko Cantelli Theorem
 
n=10000;
U=grand(1,n,"unf",0,1);

clf()
plot2d2(-gsort(-U),(1:n)./n,2)
xtitle("Convergence de la FDR empirique en norme sup")

scf()
plot2d2(-gsort(-U),sqrt(n)*((1:n)./n+gsort(-U)),2)
xtitle("sqrt(n)(F_n -F) converge ps vers un Pont Bronwien")

// Application de Monte Carlo
// Volume de la boule unité dans R^d avec la norme p

function V=Sphere(d,n,p)
    X= grand(d,n,"unf",-1,1)
    V=sum(1*(cumsum(abs(X).^p,1)<1),2).*(2^[1:d])'/n
endfunction

function logV=LogSphere(d,n,p)
    X= grand(d,n,"unf",-1,1)
    V=log(sum(1*(cumsum(abs(X).^p,1)<1),2)/n) +d*log(2)
endfunction

M=15
V=Sphere(M,100,2)
scf())
plot2d2(1:M, V)

//scf()
//plot2d([1:M],Y)
//xtitle("Monte Carlo")

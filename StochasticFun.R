N=10000;

#Stochastic fun
# A 2-graph exponential process versus a brownian motion
T1=cbind(cumsum(rexp(N,1)),rep(1,N));
T2=cbind(cumsum(rexp(N,1)),rep(-1,N));

x=rbind(T1,T2);
l=x[order(x[,1]),]

plot(l[,1],cumsum(l[,2]),type='s',col='blue')

m=10;
h=1/m;
Z=rnorm(N*m,0,1);
W=cumsum(h*Z)

lines(seq(0,N,h)[-1],W);
lines(l[,1],cumsum(l[,2]),col='blue')
title(main='Stochastic fun')  

# How to simulate a graph exponential process more easily ?
# Simulate exponential times of parameter lambda =1 : E_j
# Choose one of the parameters lambda_j with proba p_j  
# (1/lambda)*E gives exponentials of differents parameters
# The law of the difference between the coordinates associated with the exponentials linked to p_j is 
# an exponential of parameter p_j * ?

p=0.3;
ll=9*rbinom(N,1,p)+2;
E=rexp(N,1);
EE=(1/ll)*E;
plot(cumsum(E),1:N,col='blue',type='s');

T=cumsum(E);
qq=1*(ll==2);
q=sum(qq);
TT=1:q;
k=1;
for (j in 1:N){if(qq[j]==1){TT[k]<-T[j];k<-k+1;}}
lines(TT,1:q)

x11()
plot(sort(TT[-1]-TT[-q]),(1/(q-1))*(1:(q-1)),col='red',type='s')
lines(seq(0,14,0.1),pexp(seq(0,14,0.1),p*2.33))













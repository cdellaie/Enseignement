#Toy Model

N=1000;
X = rnorm(N, 0,1);
p=0.5;
b0=0.5;
b1=2;
C=rbinom(N,1,p);
Y= (b0+b1*C)*X;

plot(X,Y,col='blue',pch='+');

reg<- lm(Y ~ X*C);

summary(reg);

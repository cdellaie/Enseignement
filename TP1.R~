#premieres manipulations

#simuler un vecteur de loi normale
N=1000; 
m=0; V=1;

N1=rnorm(N,m,V);
N2=rnorm(N,m,V);

plot(N1,N2, col= "blue", pch="+")

#tracer la fonction de répartition empirique de N1
plot(sort(N1),1:N,type='s')

#densité de la loi normale
plot(t, dnorm(t,mean=0,sd=1/5), type='l')
for (j in 2:4) {lines(t, dnorm(t,mean=0,sd= 1/j),col=j)}

#un petit exercice 
E=rexp(N,1);
U=runif(N,0,1);

X=sqrt(E)*cos(2*pi*U);
Y=sqrt(E)*sin(2*pi*U);
t=seq(-2,2,0.1);

plot(X,Y,col="blue", pch="+")
plot(sort(X),(1/N)*(1:N),col="blue",type='s')
lines(t,pnorm(t,mean=0,sd=sqrt(0.5)),col="red")
title(main="Loi de X")

#Que font dnorm pnorm qnorm rnorm ?

#Hello World Version R

stackloss

#analyse rapide
summary(stackloss)

plot(stack.loss ~ Air.Flow, data=stackloss,  
     xlab = "Air", 
     ylab = "Stackloss", 
     las = 1,
     col="blue")
title(main = "Nuage de points")

#regression lineaire multiple
regression = lm (stack.loss ~
		Air.Flow + Water.Temp + Acid.Conc.,
		data= stackloss)
summary(regression)

abline(lm (stack.loss ~ Air.Flow,data=stackloss), col='red')
#intervalles de confiance
confint(regression)

#prediction d'apres le modele
newdata = data.frame(Air.Flow=72,Water.Temp = 10, Acid.Conc. = 3)
predict(regression, newdata)

#avec intervalle de confiance
newdata = data.frame(Air.Flow=72,Water.Temp=20,Acid.Conc.=85)

#The 95% confidence interval of the stack loss with the given parameters is between 20.218 and 28.945.
predict(regression, newdata, interval="confidence") 

#multiple coefficient of determination
summary(regression)$r.squared 
summary(regression)$adj.r.squared #ajuste

# significativite : la p-value de Air.Flow and Water.Temp est inférieure à 0.05, ce sont donc des variables significatives




install.packages('tseries')
library(tseries)

# téléchargement des données
data=read.csv('table.csv')
summary(data)
plot(Open ~ Low, data=data,pch='+',col='blue')

# Rendements
Y=data$Open
N=length(Y)
Rdt=log(Y[-1]/Y[-N])
plot(Rdt,type='s',col='blue')
jarque.bera.test(Rdt)

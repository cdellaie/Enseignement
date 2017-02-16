#import de la table et visualisation de max03 en fonction de T12
data <- read.table("ozone.dta",header = TRUE)
plot(data[c(2,6)],col="blue",pch="+")

plot(maxO3 ~ T12, data=data,  
     xlab = "T à midi", 
     ylab = "Max d'ozone", 
     las = 1)
title(main = "Nuage de points")

#regression lineaire
mco <- lm(maxO3 ~ T12, data=data)
coef(mco)
fitted(mco)


plot(maxO3 ~ T12, data=data,  
     xlab = "T à midi", 
     ylab = "Max d'ozone", 
     las = 1,
     col="blue",
     strf='143')
abline(mco, col='red')
title(main = "Nuage de points")

#Brevet 2014

install.packages("gdata")
library(gdata)                                   
mydata = read.xls("Brevet2014.xls")


#Obesite et sexe

install.packages(ISwR)
library(ISwR)

summary(bp.obese)

#affichage
plot(obese ~ bp, data=bp.obese,  
     xlab = "Pression sanguine", 
     ylab = "Ratio obesite", 
     las = 1)

#library ggplot2

install.packages('ggplot2')
library(ggplot2)

qplot(obese,bp,data=bp.obese,colour=sex)
title(main = 'Données')

#regression
mco <- lm(obese ~ bp, data=bp.obese)
coef(mco)
fitted(mco)


plot(obese ~ bp, data=bp.obese ,  
     xlab = "Pression sanguine", 
     ylab = "Ratio d'obésité", 
     las = 1,
     col="blue",
     strf='143')
abline(mco, col='red')
title(main = "Regréssion")

#avec les termes d'interaction
reg=lm(obese ~ bp * sex,data=bp.obese)
summary(reg)
co = coef(reg)

plot(obese ~ bp, data=bp.obese ,  
     xlab = "Pression sanguine", 
     ylab = "Ratio d'obésité", 
     las = 1,
     col=ifelse(sex==1,"red","blue"),
	pch='+',
     strf='143')
abline(a=co[1],b=co[2], col='blue')
abline(a=co[1]+co[3],b=co[2]+co[4], col='red')
title(main = "Régression")
legend(180,2.3,c("Women","Men"),col = c("blue","red"),pch='+')



#idee de TP : méthode du recuit simulé et problème du voyageur de commerce
#cryptographie par analyse fréquentielle

#Introductory Statistics with R
install.packages('ISwR')

#codage par analyse frequentielle

alpha = unlist(strsplit('abcdefghijklmnopqrstuvwxyz',''))
beta = sample(alpha)

hash<- function(a,b,ww)
	{
	x=unlist(strsplit(ww,''))
	xx=x
	i=1
	for (l in x){xx[i]=b[grep(l,a)]; i = i+1;}
	return(xx)#ou return(paste(xx,collapse=""))
	}

stat<-function(w)
	{
	ww=unlist(strsplit(w,''))
	a=1:26;
	j=1;
	for (l in alpha)
		{
		a[j]=length(grep(l, ww)); 
		j=j+1;
		}
	return(matrix(c(alpha,a),ncol=2))
	}

txt="ceciestunmessagecode"
code=paste(hash(alpha,beta,txt),collapse="")


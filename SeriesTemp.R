install.packages('tseries')
library(tseries)

# téléchargement des données

###########
## Data1 ##
###########

data=read.csv('table.csv')
summary(data)
plot(Open ~ Low, data=data,pch='+',col='blue')

# Rendements

Y=data$Open
N=length(Y)
Rdt=log(Y[-1]/Y[-N])
plot(Rdt,type='s',col='blue')

# Jarque Bera : determine si les observations suivent une loi gaussienne
# S= coeff de symetrie= m3 / \sigma^3 , K= kurtosis = m4 / \sigma^4
# H0 : S=0 K=3 vs H1 : (S=/0 ou K=/3)

jarque.bera.test(Rdt)

###########################################################################################
##                                                                                       ##
##     Indice de ATX de 11/11/92 à 11/05/2016                                            ## 
##     https://fr.finance.yahoo.com/q/hp?s=%5EATX&b=11&a=10&c=1960&e=12&d=04&f=2016&g=d  ##
##                                                                                       ## 
###########################################################################################

ATX=read.csv('ATX.csv') 

# Etapes pour l'étude d'une série temporelle
# 1. Tester la stationarité : Tests ADF, et de Philipps-Perron. But : confirmer qu'il n'y a pas de racine unitaire
# 2. Choix d'un modèle ARMA(p,q) par exemple pour la serie désaisonalisée P(L)X (polynôme en lag)
# 3. Autocorrélogramme des résidus : les erreurs sont censées suivre un bruit blanc
# 4.

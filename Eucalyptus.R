data <- read.table('eucalyptus.txt',header=TRUE,sep=';')
summary(data)

plot(ht ~ circ, data = data) 

############################################################
### L'ozone: ANOVA 1
############################################################
plot(O3~vent,data=ozone)
### modele mi anova 1
mod1 <- lm(O3~vent-1,data=ozone)
summary(mod1)

### fonction anova
anova(mod1)

### modele avec contrainte
mod2 <- lm(O3~vent,data=ozone)
### tableau d'anova
anova(mod2)
### resume
summary(mod2)

### contraste treatment :
lm(O3~C(vent,treatment),data=ozone)
##ou 
lm(O3~vent,contrasts=list(vent="contr.treatment"), data = ozone)

### contraste treatment base 2e modalite
lm(O3~C(vent,base=2),data=ozone)

### contraste : orthogonalite
II <- length(levels(ozone$vent))
nI <- table(ozone$vent)
CONTRASTE<-matrix(rbind(diag(II-1),-nI[-II]/nI[II]),II,II-1)
mod3 <- lm(O3~C(vent,CONTRASTE),data=ozone)
anova(mod3)
summary(mod3)

### contraste : somme
mod4 <- lm(O3~C(vent,sum),data=ozone)
##ou
lm(O3~vent,contrasts=list(vent="contr.sum"), data = ozone)
anova(mod4)
summary(mod4)

### residus
library(lattice)
resid2 <- resid(mod2)
## boxplot par vent
plot(resid2~vent,data=ozone,ylab="residus")
## par secteur
plot(resid2~jitter(fitted(mod2)),xlab="ychap",ylab="residus")
xyplot(resid2~I(1:50)|vent,data=ozone,xlab="index",ylab="residus")
### qqplot
plot(mod2,which=2)


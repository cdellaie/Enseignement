##################################################
##		Voyageur de commerce		##
##		Méthode du recuit simulé	##
##################################################

#############
# FONCTIONS #
#############

# Affiche un chemin
chemin<- function(U,V)
	{
	N=min(length(U),length(V));
	for ( j in 2:N ) {segments(U[j-1],V[j-1],U[j],V[j])}
	}

# Permute les villes i et j dans un chemin
permutation <- function(w,i,j)
	{
	ww<- w;
	ww[i]<- w[j];
	ww[j] <- w[i];
	return(ww);
	}

# Calcule la longuer d'un chemin
cost <- function(U,V){ N=min(length(U),length(V));
		return(sum(sqrt((U[-1]-U[-N])^2+(V[-1]-V[-N])^2)))}

# Méthode du recuit simulé sur une carte (U,V), de chemin initial l0, pour m itérations
MRS <- function(U,V,l0,m)
	{
	l=l0;
	error=1:m;
	error[1]=cost(U[l0],V[l0]);
	for (k in 2:m)
		{
		s=runif(1,0,1);
		x=sample(l,2);
		T=1/log(k);
		ll=permutation(l,x[1],x[2]);
		e=error[k-1];
		if (s< min(1,exp( (cost(U[l],V[l])-cost(U[ll],V[ll]))/T )) )
			{l<- ll;e<-cost(U[ll],V[ll]);};
		error[k]=e;
		}
	return(list(l,error));
	}

# MRS avec en plus une sauvegarde de tous les chemins sous la forme d'un GIF
library('animation')
Anim <- function(U,V,l0,m)
	{
	l=l0;
	error=1:m;
	error[1]=cost(U[l0],V[l0]);
	saveGIF({
		ani.options(interval=0.01)
  		count =0
  		for(k in 2:m){

    		s=runif(1,0,1);
		x=sample(l,2);
		T=1/log(k);
		ll=permutation(l,x[1],x[2]);
		e=error[k-1];
		if (s< min(1,exp( (cost(U[l],V[l])-cost(U[ll],V[ll]))/T )) )
			{l<- ll;e<-cost(U[ll],V[ll]);};
		error[k]=e;
    		count = count +1
		plot(U,V,col='blue');
		title(main='Algorithme du recuit simulé',sub=paste("Time = ",count), cex.main = 3, cex.sub = 2)
		chemin(U[l],V[l])
  		}
		}, interval = 1, movie.name = "Voyageur.gif", ani.width = 1000, ani.height = 1000)
	return(list(l,error));
	}

###############
# Simulations #
###############

N=50;
X=runif(N,0,1);
Y=runif(N,0,1);

# Affichage de chemins 
l=1:N;
for (j in 1:N)
	{
	x11();
	plot(X,Y,col='blue');
	chemin(X[l],Y[l]);
	l<- permutation(l,1,j);
	Sys.sleep(0.5);
	}

# Villes disposées aléatoirement sur un cercle
P=cos(2*pi*X);
Q=sin(2*pi*X);

calcul = MRS(X,Y,1:N,50000);
court=calcul[[1]];
erreur=calcul[[2]];

# Graphiques 

x11();
plot(X,Y,col='blue');
chemin(X[court],Y[court])

x11();
plot(1:50000,erreur,type='s',col='blue');

cercle=MRS(P,Q,1:N,100000);
arc=cercle[[1]];
longueur = cercle[[2]];

x11();
plot(P,Q,col='blue');
title(main='Algorithme du recuit simulé')
chemin(P[arc],Q[arc])

x11();
plot(1:100000,longueur,type='s',col='blue');
title(main='Evolution de la longueur du chemin')

# Pour faire une animation

Anim(P,Q,1:N,100)


#########################
#########################
#########################

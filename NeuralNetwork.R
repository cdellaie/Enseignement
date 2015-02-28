#preliminary functions

couche<-function(t){return(1/(1+exp(-t)))};

neurone <- function(W,x)
	{
	N<-dim(W)[1];
	y<-x;
	for (j in 1:N){
		y <- couche(W[j,]*y); 
		}
	return(y)
	}

#a neural network is represented as a list of 3 elements : 
#the matrix of weight, then first and final layer's weight

training <- function(network,data,t)
	{
	u <- network[[2]];
	v <- network[[3]];
	W <- network[[1]];

	x <- couche(u*data);
	last <- neurone(W,x);
	y <- couche(v*last); 
	E <- sum((y-t)**2);
	
	WW <- W;
	}
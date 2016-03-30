library('igraph')

# Creation d'un graphe aleatoire de taille N dont 2 sommets sont connectés avec 
# probabilite p

binomial_graph <- function(N,p)
	{
	A=matrix(rbinom(N*N,1,p),nrow=N);
	G=graph.adjacency(A,mode='undirected');
	return(G);}

# Creation d'un etat aleatoire, qui attribue un spin au hasard parmi S  
# a chaque sommet

state <-function(G,p,S)
	{
	V<-sample(1:S,length(V(G)) ,replace='True');
	return(V);
	}

weight <-function(q,beta, x,y)
	{
	w=ifelse(x==y,1,-1);
	return(q**(- beta *w));
	}

energy <- function(q,beta,s,A)
	{
	
	}
	
X=binomial_graph(10,0.1)
X$name='Ising model : a configuration on a binomial graph'
s=state(X,0.5,2);
V(X)$color = ifelse(s==1,V(X)$color<- 'blue', V(X)$color<- 'red')
plot(X,layout=layout.fruchterman.reingold,vertex.size=5, vertex.label=NA)
title(main=X$name)

# Some cool functions from tutorials
# Minimum spanning tree and coloring graph

graph.density(X)
diameter(X)
plot(minimum.spanning.tree(X))

g <- erdos.renyi.game(60, 1/20)
comps <- clusters(g)$membership
colbar <- rainbow(max(comps)+1)
V(g)$color <- colbar[comps+1]
plot(g, layout=layout.fruchterman.reingold,
vertex.size=5, vertex.label=NA)



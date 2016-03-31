##############################################################################
##			Simulation with igraph				    ##
## 	from http://www.r-bloggers.com/going-viral-with-rs-igraph-package/  ##
##############################################################################

library('igraph')

# Function to implement an epidemy on a graph G from a initial population infected Vinitial

spreadVirus <- function(G,Vinitial,p){  
  # Precompute all outgoing graph adjacencies
  G$AdjList = get.adjlist(G,mode="out")
  
  # Initialize various graph attributes
  V(G)$color    = "blue"
  E(G)$color    = "black"
  V(G)[Vinitial]$color    <- "yellow"

  # List to store the incremental graphs (for plotting later)
  Glist <- list(G)
  count <- 1
  
  # Spread the infection
  active <- Vinitial
  while(length(active)>0){
    new_infected <- NULL
    E(G)$color = "black"
    for(v in active){
      # spread through the daily contacts of vertex v
      daily_contacts <- G$AdjList[[v]]
      E(G)[v %->% daily_contacts]$color <- "red"
      for(v1 in daily_contacts){
        new_color <- sample(c("red","blue"), 1 ,prob=c(p,1-p))       
        if(V(G)[v1]$color == "blue" & new_color=="red"){ 
          V(G)[v1]$color <- "red"
          new_infected <- c(new_infected,v1)
        }
      }
    }
    # the next active set
    active <- new_infected
  
    # Add graph to list
    count <- count + 1
    Glist[[count]] <- G
  }
  return(Glist)
}

# Specify a directed graph by hand
G <- graph.formula(1-+2,1-+3,2-+4,2-+5,3-+6,5-+7,7-+8,8-+9,9+-7, 9-+10,
      6-+9,1-+5,5-+20,3-+9,10-+11,10-+15,11-+12,11-+13,13-+14, 14-+15,
      15-+11,4-+8,15-+16,15-+17,17-+18,18-+4,17-+19,19-+20,
      20-+1,14-+1,19-+3)
Vinitial <- c("1","10")

# Run the simulation
set.seed(55555)
Glist <- spreadVirus(G,Vinitial,1/2)

# Animation plots (generates a .GIF)
install.packages('RMySQL', repos='http://cran.us.r-project.org')
library('animation')

L <- layout.fruchterman.reingold(Glist[[1]])

ani.options(interval=1)

saveGIF({
  count =0
  for(i in 1:length(Glist)){
    plot(Glist[[i]], layout = L,
         vertex.label = NA,
         vertex.size = 10,
         vertex.color= V(G)$color,
         vertex.frame.color= "white",
         edge.arrow.size = 1,
         edge.color=E(G)$color)
    count = count +1
    title(main="Graph simulation example", 
          sub=paste("Time = ",count), cex.main = 3, cex.sub = 2)
  }
}, interval = 1, movie.name = "demo.gif", ani.width = 1000, ani.height = 1000)

# More realistic graph

N <- 200
in.deg  <- sample(1:N, N, replace = TRUE, prob = exp(-.5*1:N))
G <-degree.sequence.game(in.deg=in.deg,out.deg=in.deg,method="simple.no.multiple")

# set seed for reproducible example
set.seed(2014)

# build graph list
Vinitial   = sample(V(G),5,replace=FALSE)
Glist <- spreadVirus(G,Vinitial,1/2)

# Circle layout is better for large graphs
L = layout.circle(Glist[[1]])

# Animation
ani.options(interval=1)
saveGIF({
  count =0
  for(i in 1:length(Glist)){
    plot(Glist[[i]], layout = L,
         vertex.label = NA,
         vertex.size = 4,
         vertex.color= V(G)$color,
         vertex.frame.color= "white",
         edge.arrow.size = 1,
         edge.color=E(G)$color)
    count = count +1
    title(main="Graph simulation example (200 nodes)", 
          sub=paste("Time = ",count), cex.main = 3, cex.sub = 2)
  }
}, interval = 1, movie.name = "demo.gif", ani.width = 1000, ani.height = 1000)

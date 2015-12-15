// Les deux fonctions "produit" et "evolution" font le même 
// travail de manières différentes
// Elles affichent les proportions dans la population infinie
// et les proportions dans une population de taille n
// Laquelle est la plus efficace ? 

////////////////////////////////////////
////////////////////////////////////////
function produit(n)
mu0=[.5 .3 .2]
P=[.6 .2 .2;.15 .7 .15;.05 .05 .9]
//Evolution de la population infinie
mu12=zeros(13,3)
mu12(1,:)=mu0; 
for i=1:12 
   mu12(i+1,:)=mu12(i,:)*P
end
xbasc()
for j=1:3
  plot2d([0:12],mu12(:,j),j)
end

//Population finie : on génère n fois une trajectoire
S=zeros(13,3)
for k=1:n
  U=rand(1,1)
  X=1+(U<.2)+(U<.5)
  X=[X grand(12,'markov',P,X)]'
  for i=1:13
    S(i,X(i))=S(i,X(i))+1
  end
end
S=S/n
for j=1:3
  plot2d([0:12],S(:,j),j+3)
end
legends(['Courbe théo 1','Courbe théo 2','Courbe théo 3','Courbe emp 1','Courbe emp 2','Courbe emp 3'],[1,2,3,4,5,6],2)
xtitle('Proportions dans des populations infinie et finie')


////////////////////////////////////////
////////////////////////////////////////
function evolution(n)
mu0=[.5 .3 .2]
P=[.6 .2 .2;.15 .7 .15;.05 .05 .9]
//Evolution de la population infinie
mu12=zeros(13,3)
mu12(1,:)=mu0; 
for i=1:12 
   mu12(i+1,:)=mu12(i,:)*P
end
xbasc()
for j=1:3
  plot2d([0:12],mu12(:,j),j)
end

//Population finie : on génère une fois n trajectoire
S=zeros(3,13)
N=grand(1,"mul",n,mu0(1:$-1)')
X=[ones(N(1),1);2*ones(N(2),1);3*ones(N(3),1)]
X=[X grand(12,"markov",P,X)]
for i=1:3
   S(i,:)=sum(1*(X==i),'r')/n
end
for j=1:3
  plot2d([0:12],S(j,:),j+3)
end
legends(['Courbe théo 1','Courbe théo 2','Courbe théo 3','Courbe emp 1','Courbe emp 2','Courbe emp 3'],[1,2,3,4,5,6],2)
xtitle('Proportions dans des populations infinie et finie')




#Uniform distribution on the sphere

library("plot3D");

m=100000;

X= rnorm(m,0,1);
Y= rnorm(m,0,1);
Z= rnorm(m,0,1);

N= sqrt(X^2+Y^2+Z^2);
scatter3D(X/N,Y/N,Z/N);

(X/N)^2+(Y/N)^2+(Z/N)^2;

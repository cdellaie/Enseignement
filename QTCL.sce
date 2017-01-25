/////////////////////////////
//   Quantum Probability   //
/////////////////////////////

// Marche de Bernoulli 
// Following Biane, Pitman Theorem

x = [0,1;1,0];
y = [0,-%i;%i,0];
z = [1,0;0,-1];

p=0.5;
P=[p, 0 ; 0 , 1-p]

n=9;
X=x;
Q=p;
for k=1:n
    X = kron(X,eye(2,2))+kron(eye(2**k,2**k),x);
    Q = kron(Q,p)
end

disp(trace(Q*(X)^2))

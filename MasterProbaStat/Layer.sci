/////////////////////////
//    Neural network   //
/////////////////////////

// Multilayer :
// N layers of same size d = W matrix Nd x d
// with output function tanh(x)= (e^x -e^-x)/ (e^x+e^-x)
// The Network computes xi -> x_(i+1) =  tanh ( W[di:d i+1]*xi ) 

function [output,dL] = Network(W,x,t)
    [Nd,d]=size(W);
    N= Nd/d;
    dL =zeros(W);
    output = [x];
    a=[];
    
    for i=0:(N-1)
        k=d*i
        h = (W((k+1):(k+d),:))*output ; // Wx
        y1=exp(h);
        y2=exp(-h);
        a = [a , 4 ./ ( (y1-y2) .^2 ) ] ; // f'(Wx)
        output= [output, (y1-y2)./ (y1+y2)]; // f(Wx)) 
    end
    e=a(:,N) .* (t-output(:,N)); // error 
    dL((Nd-d+1):Nd ,:) = e * (output(:,N+1))';//
    // Backpropagation of the error down the layers
    for j=gsort(0:(N-2))
        k=d*j;
        e=  (W((k+1):(k+d),:))'*e ; //a(:,j)' .*( )
        //disp(size(a));
        dL((k+1):(k+d),:)=  e * (output(:,j+2))'; 
    end
    output=output(:,N);
endfunction

// Learning loop
// Gradient descent : update of parameters

function WW=Training(W,x,t,h) 
    // W initial neural network, x trainig batch, t target sample
    // h step in the gradient descent 
    WW=W;
    [d,M]=size(x);
    for i=1:M
        [y,grad]=Network(WW,x(:,i),t(:,i));
        WW= WW- h *grad;
    end
endfunction

// Test : Classification problem
// Sample of a mixture of 2 gaussians in the plane
// Learning to classify the two family

// Sample
m=1000;
X=grand(2,m,'nor',0,1);
Y=1*(grand(1,m,'unf',0,1)>0.5);
h=10*(zeros(X)+1);

//training set
in= X+([Y;Y].*h)
target = 1*[Y==0;Y==1];
//plot2d(in(1,:),in(2,:),style=-1)

N= 3; // number of layers
W=grand(N*2,2,'nor',0,1); // initial network
disp("Classification : mélange de gaussiennes");
disp("Réseau à "+string(N)+" couches entraîné sur "+string(m)+" iterations.");
disp(Training(W,in,target,0.1))
//out = 1*(sum(Network(W,in),1)>0);

//WW =Training(W,x)

//err = sum((out-Y).^2)



 





















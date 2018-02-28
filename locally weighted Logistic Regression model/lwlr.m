function y=lwlr(X_train,y_train,x,tau)
 X_train=[ones(size(X_train,1),1), X_train];
 x=[1;x];
 m = size(X_train,1);
 n = size(X_train,2);
 theta = zeros(n,1);
 lamada=1e-4;
 w = exp(-sum((X_train - repmat(x', m, 1)).^2, 2) / (2*tau));
 
%repmat(x,m,n) repeatedly form ans with m times in row and n times in
%column
%sum(A,1) compute the sum of every columns
%sum(A,2) compute the sum of every rows

g=ones(n,1);
while(norm(g,2)>1e-6)
    h=1./(1+exp(-X_train*theta));
    g=X_train'*(w.*(y_train-h))-lamada*theta;
    H=-X_train'*diag(w.*h.*(1-h))*X_train -lamada*eye(n);
    theta=theta-H\g;
    
    %diag(w.*h.*(1-h)) form an diagonal matrix of given vector 
    % \ means H\g=H^-1 * g    g/H means g * H^(-1)
end
y=double(x'*theta >0);

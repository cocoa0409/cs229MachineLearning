function W = ica_2(X)

[n,m] = size(X);
chunk = 100;
alpha = 0.0005;
W = eye(n);
old_W=zeros(n);
iter=1;
while(norm(W - old_W)> 1e-5 )
    disp([num2str(iter)]);
    iter=iter+1;
    X = X(:,randperm(m));
    old_W=W;
    for i=1:floor(m/chunk),
      Xc = X(:,(i-1)*chunk+1:i*chunk);
      dW = (1 - 2./(1+exp(-W*Xc)))*Xc' + chunk*inv(W');
      W = W + alpha*dW;
    end
end

%converge?
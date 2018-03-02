function theta = l1ls(X,y,lambda)
%X=[ones(size(X,1),1),X];
m = size(X,1);
n = size(X,2);
theta = zeros(n,1);
old_theta = ones(n,1);

while(norm(theta - old_theta)>=1e-5)
    old_theta=theta;
    for i=1:n,
        if theta(i)>0,
            theta(i)=0;
            theta(i)=max((-X(:,i)'*(X*theta-y)-lambda)/(X(:,i)'*X(:,i)),0);
        else
            theta(i)=0;
            theta(i)=min((-X(:,i)'*(X*theta-y)+lambda)/(X(:,i)'*X(:,i)),0);
        end
    end
end
            
            
            
        
        

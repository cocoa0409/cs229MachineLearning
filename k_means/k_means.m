function [clusters, centroids] = k_means(X, k)
m=size(X,1);
n=size(X,2);
centroids = rands(k,n);
clusters = zeros(m,1);
old_centroids = zeros(k,n);
distance= zeros(k,1);

while norm(centroids - old_centroids,1)>1e-5
    old_centroids=centroids;
    for i=1:m,
        for j=1:k,
            distance(j)=norm(X(i,:)-centroids(j,:),2).^2;
        end
        result=find(distance==min(distance));
        clusters(i)=result(1);
    end
    
    for j=1:k,
        sum=zeros(1,n);
        enum=0;
        for i=1:m,
            if clusters(i)==j
                sum=sum+X(i,:);
                enum=enum+1;
            end
        end
        centroids(j,:)=sum/enum;
    end
end
end
    
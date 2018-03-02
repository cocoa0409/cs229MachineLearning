function [clusters, centroids] = k_means_updata(X, k)

m = size(X,1);
n = size(X,2);
oldcentroids = zeros(k,n);
centroids = X(ceil(rand(k,1)*m),:);
%ceil represent ceiling (round up to an integer )
%randomly get k pair of data from X!

while (norm(oldcentroids - centroids) >1e-15)
  oldcentroids = centroids;
  % compute cluster assignments
  for i=1:m,
    dists = sum((repmat(X(i,:), k, 1) - centroids).^2, 2);
    %sum(,2)compute the sum of row 
    [min_dist, clusters(i,1)] = min(dists);
    %min_dist save the minimum value and clusters(i,1) save its index of
    %its row. That's to say, if dists is an matrix, it comput min with
    %respect to its column!!!!!
    %C=[1,2,3;4,5,0.1]
    %[A,B]=min(C)
    %B=[1,1,2](row index of minimum of every colum)
    %A=[1.0000    2.0000    0.1000]
  end
  
  draw_clusters(X, clusters, centroids);
  pause(0.2);
  
  % compute cluster centroids
  for i=1:k,
    centroids(i,:) = mean(X(clusters == i, :));
  end
end

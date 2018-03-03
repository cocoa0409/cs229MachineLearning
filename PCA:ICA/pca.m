function U = pca(X)

[U,S,V] = svd( X);

%U store the eigenvecors of X*X' in every column in decreasing order(eigenvalue)
%V store the eigenvector of X'*X in every column in decreasing order
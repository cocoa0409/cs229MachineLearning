# Algorithms of MachineLearning

Locally weighted Logistic Regression    (2018.2.28)

As a generalization of Locally weighted linear regression, I use the locally weighted methed to implement classification problem. The most easy case is Logistic regression. It's interesting that we could got the decision boundrary by implement

>> [X,y]=load_data

>> plot_lwlr(X, y, 0.05, 500)

For smaller τ, the classifier appears to overfit the data set, obtaining zero training error, but outputting a sporadic looking decision boundary.
As τ grows, the resulting decision boundary becomes smoother, eventually converging (in the limit as τ → ∞ to the unweighted linear regression solution).


l1 regularization for least squares    (2018.3.2)

For λ = 1, our implementation of l1 regularized least squares recovers the exact sparsity pattern of the true parameter that generated the data. In constrast, using any amount of l2 regularization still leads to θ’s that contain no zeros. This suggests that the l1 regularization could be very useful as a feature selection algorithm: we could run l1 regularized least squares to see which coefficients are non-zero, then select only these features for use with either least-squares or possibly a completely different machine learning algorithm.

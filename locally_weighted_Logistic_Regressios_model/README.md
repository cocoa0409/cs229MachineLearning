Locally weighted Logistic Regression    (2018.2.28)

As a generalization of Locally weighted linear regression, I use the locally weighted methed to implement classification problem. The most easy case is Logistic regression. It's interesting that we could got the decision boundrary by implement

>> [X,y]=load_data
>> plot_lwlr(X, y, 0.05, 500)

For smaller τ, the classifier appears to overfit the data set, obtaining zero training error, but outputting a sporadic looking decision boundary.
As τ grows, the resulting decision boundary becomes smoother, eventually converging (in the limit as τ → ∞ to the unweighted linear regression solution).

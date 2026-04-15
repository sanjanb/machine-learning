### 1. The Gradient Descent Formulation
To use Gradient Descent for Ridge Regression, we first define the **Loss Function** in vector form:
$$\text{Loss} = \frac{1}{2}(XW - Y)^T(XW - Y) + \frac{1}{2}\lambda W^T W$$
*(The $\frac{1}{2}$ is added for mathematical convenience during differentiation.)*

The **Gradient** (derivative with respect to weights $W$) is calculated as:
$$\frac{\partial L}{\partial W} = X^T(XW - Y) + \lambda W$$

The **Update Rule** for the weights in each iteration is:
$$W_{\text{new}} = W_{\text{old}} - \eta \left( X^T(XW - Y) + \lambda W \right)$$
where $\eta$ (eta) is the learning rate.


### 2. Key Observations
* **Iterative Learning:** Unlike the closed-form solution (which requires a matrix inverse), Gradient Descent updates the weights step-by-step. This is much more efficient for datasets with a very large number of features.
* **Shrinkage:** The term $+\lambda W$ in the gradient ensures that weights are pulled toward zero. In the update rule, this acts as a "weight decay," reducing the magnitude of $W$ at every step.

### 3. Implementation in Python
The video demonstrates how to implement this using a custom class:

```python
class MyRidgeGD:
    def __init__(self, epochs, learning_rate, alpha):
        self.epochs = epochs
        self.lr = learning_rate
        self.alpha = alpha
        
    def fit(self, X_train, y_train):
        # Initialize weights (including intercept)
        self.theta = np.ones(X_train.shape[1] + 1)
        X_train = np.insert(X_train, 0, 1, axis=1) # Add ones for intercept
        
        for i in range(self.epochs):
            # Calculate gradient
            y_hat = np.dot(X_train, self.theta)
            gradient = np.dot(X_train.T, (y_hat - y_train)) + self.alpha * self.theta
            # Update weights
            self.theta = self.theta - self.lr * gradient
            
        self.intercept_ = self.theta[0]
        self.coef_ = self.theta[1:]
```

### 4. Comparison with Scikit-Learn
* **`SGDRegressor`:** Scikit-Learn’s `SGDRegressor` with `penalty='l2'` implements Stochastic Gradient Descent for Ridge Regression.
* **`Ridge` with Solver:** The `Ridge` class itself can also use gradient-based solvers (like `sag` or `saga`) by setting the `solver` parameter.

[Image comparing standard OLS vs Ridge Regression with different alpha values on a data plot]

### Summary of the Series
1.  **Part 1:** Geometric intuition—how Ridge shrinks the regression line to prevent overfitting.
2.  **Part 2:** Closed-form solution—calculating weights directly using the matrix inverse formula $(X^TX + \lambda I)^{-1}X^TY$.
3.  **Part 3:** Gradient Descent—using an iterative approach to find weights, ideal for large-scale machine learning tasks.

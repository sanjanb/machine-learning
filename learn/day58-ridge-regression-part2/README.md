### 1. Mathematical Formulation (Simple Linear Regression)
In Ridge Regression, we modify the standard Ordinary Least Squares (OLS) cost function by adding an **L2 penalty** term:
$$\text{Cost Function} = \sum_{i=1}^{n} (y_i - \hat{y}_i)^2 + \lambda m^2$$
* **Derivation:** By differentiating this function with respect to the intercept ($b$) and slope ($m$) and setting them to zero, we find the new formula for $m$:
$$m = \frac{\sum (y_i - \bar{y})(x_i - \bar{x})}{\sum (x_i - \bar{x})^2 + \lambda}$$
* **Key Insight:** As $\lambda$ increases, the denominator gets larger, forcing the slope ($m$) to decrease toward zero. This effectively "shrinks" the coefficients to prevent overfitting.


### 2. Matrix Formulation (Multiple Linear Regression)
For datasets with many features, the derivation uses matrix calculus. The goal is to find the weights vector $W$:
$$\text{Loss} = (XW - Y)^T(XW - Y) + \lambda W^T W$$
* **The "Closed-Form" Solution:** After differentiating with respect to $W$, the optimal weights are found using:
$$W = (X^T X + \lambda I)^{-1} X^T Y$$
* **$I$ (Identity Matrix):** $\lambda$ is multiplied by an identity matrix of the same dimensions as $X^TX$ to ensure the addition is mathematically valid.


### 3. Python Code from Scratch
The video implements a custom `MyRidge` class that mimics Scikit-Learn's behavior:

**Simple 1D Implementation:**
```python
class MyRidge:
    def fit(self, X_train, y_train):
        num = np.sum((y_train - y_train.mean()) * (X_train - X_train.mean()))
        den = np.sum((X_train - X_train.mean())**2) + self.alpha
        self.m = num / den
        self.b = y_train.mean() - (self.m * X_train.mean())
```

**Multiple Dimensions (Matrix Form):**
```python
def fit(self, X_train, y_train):
    # Add a column of ones for the intercept
    X_train = np.insert(X_train, 0, 1, axis=1)
    # Create Identity Matrix
    I = np.identity(X_train.shape[1])
    # Note: Many implementations don't penalize the intercept (W0)
    I[0][0] = 0 
    # Closed-form solution
    self.W = np.linalg.inv(np.dot(X_train.T, X_train) + self.alpha * I).dot(X_train.T).dot(y_train)
```

### 4. Key Takeaways
* **Computational Complexity:** The matrix inverse operation $(X^TX)^{-1}$ has a complexity of $O(n^3)$, making the closed-form solution slow for very large datasets (thousands of features).
* **Gradient Descent:** For large-scale data, Gradient Descent is preferred over the matrix inverse method, which is the focus of the next video in the series.
* **Intercept Penalty:** Standard implementations (like Scikit-Learn) typically do not penalize the intercept ($W_0$), only the coefficients of the features.

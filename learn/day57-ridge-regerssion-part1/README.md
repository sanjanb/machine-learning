### 1. What is Regularization?
Regularization is a technique used to reduce the complexity of a model to ensure it generalizes well to new, unseen data.
* **The Problem (Overfitting):** A model performs exceptionally well on training data but poorly on test data because it has "memorized" the noise in the training set.
* **The Goal:** To reduce the variance of the model without significantly increasing its bias.
* **Types of Regularization:**
    * **Ridge Regression (L2 Regularization):** Adds a penalty based on the square of the coefficients.
    * **Lasso Regression (L1 Regularization):** Adds a penalty based on the absolute value of the coefficients.
    * **Elastic Net:** A combination of both Ridge and Lasso.

### 2. Geometric Intuition of Ridge Regression
In standard Linear Regression, the goal is to minimize the **Residual Sum of Squares (RSS)**.
In Ridge Regression, we modify the loss function by adding a **penalty term**.
$$\text{Loss} = \text{RSS} + \lambda \sum (\text{coefficient})^2$$
* **$\lambda$ (Lambda):** A hyperparameter that controls the strength of the penalty (often called `alpha` in Scikit-Learn).
* **Impact of the Penalty:** When we try to minimize this new loss function, the model is forced to keep the coefficients ($m$ or $w$) small. Large coefficients are "penalized," leading to a flatter, less complex line that doesn't overreact to every data point [[11:49](http://www.youtube.com/watch?v=aEow1QoTLo0&t=709)].


### 3. Key Hyperparameter: $\lambda$ (Alpha)
The value of $\lambda$ determines the behavior of the model:
* **$\lambda = 0$:** The penalty term vanishes, and Ridge Regression becomes identical to standard Linear Regression (high risk of overfitting).
* **Small $\lambda$:** The model is slightly constrained, reducing overfitting while maintaining accuracy.
* **Large $\lambda$:** The coefficients are pushed toward zero. This makes the model very simple (a horizontal line), which can lead to **underfitting**.

[Image showing the impact of different lambda values on a regression line, from overfitting to underfitting]

### 4. Code Implementation (Scikit-Learn)
The video demonstrates using the `Ridge` class from `sklearn.linear_model`:
1.  **Load Data:** The "Diabetes" dataset is used, which has 10 input features.
2.  **Split Data:** Standard train-test split.
3.  **Apply Ridge:**
    ```python
    from sklearn.linear_model import Ridge
    reg = Ridge(alpha=0.1) # alpha is the same as lambda
    reg.fit(X_train, y_train)
    y_pred = reg.predict(X_test)
    ```
4.  **Results:** In the example, the Ridge model with a small alpha performed slightly better on the test set than standard linear regression, showing improved generalization.
### Summary
Ridge Regression is a powerful tool for building robust linear models. By adding a small penalty to the size of the coefficients, it prevents the model from becoming too complex and sensitive to individual training points, effectively balancing the **bias-variance trade-off** [[19:36](http://www.youtube.com/watch?v=aEow1QoTLo0&t=1176)].

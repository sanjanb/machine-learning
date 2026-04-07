# Simple Linear Regression: Math & Coding from Scratch

Here we dives into the mathematical formulation of Simple Linear Regression (SLR) and demonstrates how to build a custom Linear Regression class in Python from scratch, matching the functionality of Scikit-Learn.


## 1. Two Types of Solutions
There are two primary ways to find the values of $m$ (slope) and $b$ (intercept):
* **Closed-Form Solution:** A direct mathematical formula (Ordinary Least Squares - OLS). This is what Scikit-Learn's `LinearRegression` class uses internally for small datasets.
* **Non-Closed-Form Solution:** An iterative optimization technique called **Gradient Descent**. This is used for high-dimensional data or very large datasets where OLS becomes computationally expensive.

## 2. The OLS Mathematical Formula
The goal is to minimize the **Loss Function** (Total Error).
* **Slope ($m$):** $$m = \frac{\sum_{i=1}^{n} (x_i - \bar{x})(y_i - \bar{y})}{\sum_{i=1}^{n} (x_i - \bar{x})^2}$$
* **Intercept ($b$):** $$b = \bar{y} - m\bar{x}$$
    *(Where $\bar{x}$ and $\bar{y}$ are the means of the input and output respectively).*

## 3. Deriving the Formulas
The derivation uses **Calculus** (Partial Derivatives):
1.  **Define Loss Function ($E$):** The sum of squared errors between actual values ($y_i$) and predicted values ($\hat{y}_i$).
    $$E = \sum (y_i - (mx_i + b))^2$$
2.  **Minimize $E$ with respect to $b$:** Take the partial derivative $\frac{\partial E}{\partial b}$, set it to zero, and solve. This gives the formula for $b$.
3.  **Minimize $E$ with respect to $m$:** Take the partial derivative $\frac{\partial E}{\partial m}$, substitute the value of $b$, set it to zero, and solve. This gives the formula for $m$.

## 4. Coding SLR from Scratch
The video demonstrates creating a Python class `MyLR` with two main methods:
* **`fit(X_train, y_train)`:** * Calculates the mean of $X$ and $y$.
    * Uses a loop to calculate the numerator and denominator for $m$.
    * Calculates $b$ using the derived formula.
* **`predict(X_test)`:** * Uses the calculated $m$ and $b$ to return $y = mx + b$.

## 5. Validation
* The custom `MyLR` class is tested against the same student placement dataset used in the previous video.
* The results for $m$ (approx. 0.55) and $b$ (approx. -0.82) are **identical** to the values produced by Scikit-Learn's `LinearRegression` class, proving that the manual implementation is correct.


**Summary:** While Scikit-Learn provides a "black box" for Linear Regression, understanding the OLS derivation via calculus explains exactly how the "best fit line" is mathematically determined.

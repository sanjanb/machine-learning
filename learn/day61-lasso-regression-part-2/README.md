### 1. The Core Difference in the Formula
The mathematical reason lies in where the regularization parameter **$\lambda$ (alpha)** appears in the derived formula for the coefficients ($W$ or $M$):

* **Ridge Regression:** The $\lambda$ term ends up in the **denominator**:
    $$W = \frac{X^T Y}{X^T X + \lambda}$$
    As $\lambda \to \infty$, the fraction gets smaller and smaller, approaching zero but never mathematically reaching it.
* **Lasso Regression:** The $\lambda$ term ends up in the **numerator**:
    $$W = \text{sign}(\text{OLS solution}) \times \max(0, |\text{OLS solution}| - \lambda)$$
    Because $\lambda$ is subtracted directly from the numerator, once $\lambda$ becomes equal to or greater than the original coefficient value, the result becomes **exactly zero**.


### 2. Step-by-Step Derivation (Simple Linear Case)
By differentiating the Lasso loss function ($Loss = \text{MSE} + \lambda|W|$) for a single variable, the video derives the following conditions:

1.  **If $W > 0$:** The update formula is $W = (\text{Term}) - \lambda$. As $\lambda$ increases, $W$ eventually hits zero.
2.  **If $W < 0$:** The update formula is $W = (\text{Term}) + \lambda$. Since $W$ is negative, adding $\lambda$ pushes it toward zero.
3.  **The Stop at Zero:** If increasing $\lambda$ would push a positive $W$ into negative territory (or vice versa), the algorithm stops at zero. This is because crossing zero changes the sign of the absolute value in the penalty term, causing the gradient to flip and pull it back to zero.

### 3. Sparsity and Feature Selection
* **Lasso (Sparsity):** Because it forces some coefficients to zero, Lasso effectively performs **automatic feature selection**. It discards less important features entirely.
* **Ridge (Shrinkage):** Ridge keeps every feature but reduces their impact. It is better when you believe all features have some small contribution to the outcome.

### Summary
* **Ridge:** $\lambda$ is in the denominator $\implies$ Shrinkage only.
* **Lasso:** $\lambda$ is in the numerator $\implies$ Sparsity/Feature Selection.
* **Interview Tip:** If asked why Lasso creates sparsity, explain that the L1 penalty derivative is a constant ($\lambda$), which can directly cancel out the MSE gradient, whereas the L2 penalty derivative depends on the weight itself ($2\lambda W$), making it get smaller as the weight gets smaller, thus never reaching zero.

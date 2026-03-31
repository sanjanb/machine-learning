### 1. Linear Relationship
The most fundamental assumption is that there must be a **linear relationship** between the independent variables (inputs) and the dependent variable (output) .
* **How to check:** Use **Scatter Plots**. If the points form a roughly straight line (either upward or downward), the assumption holds. If the plot shows a curve (like a parabola), linear regression is not suitable.

### 2. No Multicollinearity
Your input features should be **independent of each other**. Multicollinearity occurs when two or more input variables are highly correlated (e.g., if $X_1$ changes, $X_2$ also changes predictably).
* **Why it matters:** It makes it difficult for the model to determine the individual effect of each feature on the output .
* **How to check:** * **Variance Inflation Factor (VIF):** A VIF value above 5 or 10 usually indicates high multicollinearity.
    * **Correlation Heatmap:** Look for high correlation coefficients (close to 1 or -1) between input features.

### 3. Normality of Residuals
When you calculate the **residuals** (the difference between actual and predicted values), they should follow a **Normal Distribution** (Bell Curve).
* **How to check:**
    * **Histograms/KDE Plots:** Look for a symmetric bell shape centered around zero.
    * **Q-Q Plot (Quantile-Quantile):** The points should ideally lie on a straight diagonal line.

### 4. Homoscedasticity
The word "Homo" means same and "Scedasticity" means spread. This assumption states that the **variance of the error terms (residuals) should be constant** across all levels of the independent variables.
* **Violation (Heteroscedasticity):** If the residuals spread out or narrow down (forming a "fan" or "cone" shape), this assumption is violated.
* **How to check:** Plot **Residuals vs. Predicted Values**. You want to see a random "cloud" of points with no clear pattern.

### 5. No Autocorrelation in Error Terms
This means that the residuals should be **independent of one another**. This is particularly important in time-series data where an error at time $t$ might be related to an error at time $t-1$.
* **How to check:** Plot the residuals against time or their own index. If you see a distinct pattern (like a wave or a trend), there is autocorrelation.

### Summary Table
| Assumption | What it means | Tool to Check |
| :--- | :--- | :--- |
| **Linearity** | $X$ and $y$ have a straight-line relation | Scatter Plot |
| **Multicollinearity** | Inputs aren't related to each other | VIF / Heatmap |
| **Normality** | Errors follow a bell curve | Q-Q Plot / Histogram |
| **Homoscedasticity** | Constant error variance | Residual vs. Fit Plot |
| **Autocorrelation** | Errors are independent | Residual Plot (Time) |

By checking these five points before finalized your model, you ensure that your statistical inferences and predictions are mathematically sound.

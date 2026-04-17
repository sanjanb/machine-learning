### 1. How Coefficients Shrink
As you increase the regularization parameter **$\lambda$ (alpha)**, the coefficients (weights) of your features shrink toward zero.
* **Observation:** The magnitudes decrease significantly as $\lambda$ grows.
* **Key Fact:** While coefficients get extremely close to zero, they **never actually reach absolute zero** in Ridge Regression. This means Ridge does not perform feature selection (it keeps all variables, just makes them less impactful).


### 2. Impact on Large vs. Small Coefficients
Ridge Regression has a "selective" impact based on the initial size of the coefficient.
* **Faster Decay:** Coefficients that are initially large (highly influential features) are reduced much more aggressively than smaller ones.
* **Result:** This levels the playing field, preventing any single feature from dominating the model and causing instability.

### 3. The Bias-Variance Tradeoff
Regularization is the primary tool for managing this tradeoff:
* **Low $\lambda$:** High variance, low bias (Overfitting). The model follows the training data too closely.
* **High $\lambda$:** Low variance, high bias (Underfitting). The model becomes too simple and loses predictive power.
* **Goal:** Find the "sweet spot" where the total error (Bias² + Variance) is minimized.


### 4. Effect on the Loss Function
Adding the penalty term $\lambda \sum W^2$ changes the shape of the loss function surface.
* **Shift toward Origin:** As $\lambda$ increases, the minimum point of the loss function "moves" closer to the origin (zero weights).
* **Contour Changes:** The loss function "bowl" becomes steeper and more centered, effectively forcing the optimization algorithm to choose smaller weight values.

### 5. Why is it called "Ridge"?
The name stems from the geometry of the optimization problem.
* **Constrained Optimization:** Ridge Regression can be viewed as minimizing the original loss within a circular (disk-shaped) constraint: $\sum W^2 \leq t$.
* **The "Ridge":** In cases of multicollinearity (high correlation between features), the loss function surface creates a "ridge" or a long, flat valley. The regularization adds a "mountain" at the origin, creating a unique stable point on that ridge, making the solution mathematically stable.


### Practical Tip
Ridge Regression is most effective when you have **many features** (multiple input columns). It is less useful for simple 1D linear regression (one input, one output) since there isn't enough complexity for the penalty to significantly improve generalization.

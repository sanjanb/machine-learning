### 1. Defining the Hyperplane and Decision Boundary
In a 2D space, the decision boundary is a line represented by the equation:
$$w^T x + b = 0$$
* **$w$** is the weight vector, which is perpendicular (normal) to the hyperplane.
* **$x$** represents the input features.
* **$b$** is the bias (intercept).

For any new data point $u$, the model predicts its class based on the sign of $w \cdot u + b$. If the result is $\ge 0$, it belongs to the positive class; if $< 0$, it belongs to the negative class.


### 2. The Margins and Constraints
SVM doesn't just find a line; it finds a line with two parallel "gutters" or margins. These margins are defined by:
* **Positive Margin:** $w^T x + b = 1$
* **Negative Margin:** $w^T x + b = -1$

To ensure all points are correctly classified and stay outside the margins, SVM applies the following constraints for every training point $i$:
* $w^T x_i + b \ge 1$ (for positive class points, where $y_i = 1$)
* $w^T x_i + b \le -1$ (for negative class points, where $y_i = -1$)

These can be combined into a single unified constraint:
$$y_i (w^T x_i + b) \ge 1$$

### 3. Calculating the Width of the Margin
The objective of SVM is to maximize the distance between the two gutters. Mathematically, the width of this margin is calculated as:
$$\text{Width} = \frac{2}{\|w\|}$$
To maximize this width, we need to **minimize $\|w\|$**.

### 4. The Final Optimization Problem
The Hard Margin SVM is formulated as a constrained optimization problem:
* **Objective:** Minimize $\frac{1}{2} \|w\|^2$ (the squared norm is used for easier differentiation).
* **Subject to:** $y_i (w^T x_i + b) \ge 1$ for all $i=1, \dots, n$.


### 5. Hard Margin vs. Soft Margin
The **Hard Margin SVM** requires the data to be perfectly linearly separable. If a single point from the positive class crosses into the negative side (or vice versa), the algorithm fails to find a solution.
* **Limitation:** It is highly sensitive to outliers.
* **Solution:** For real-world, noisy data that is not perfectly separable, we use **Soft Margin SVM**, which allows for some misclassification.

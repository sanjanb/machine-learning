### 1. Geometric Intuition: From Lines to Hyperplanes
In Simple Linear Regression, you have one input ($x$) and one output ($y$). You plot these on a 2D graph and find the **"Best Fit Line."**

When you move to **Multiple Linear Regression**, you add more dimensions:
* **2 Inputs ($x_1, x_2$):** Your data points now float in a 3D space. Instead of a line, the "best fit" is a flat sheet or **Plane** that slices through the points.

* **3+ Inputs:** We can no longer visualize 4D or 5D space, but mathematically, the "plane" becomes a **Hyperplane**. It is a flat surface in higher-dimensional space that tries to stay as close to all data points as possible.

### 2. The Mathematical Formulation
The goal of MLR is to find the coefficients ($\beta$ values) for the following equation:
$$y = \beta_0 + \beta_1x_1 + \beta_2x_2 + ... + \beta_nx_n + \epsilon$$

* **$\beta_0$ (Intercept):** The value of $y$ if all inputs were zero.
* **$\beta_1, \beta_2...$ (Weights/Coefficients):** These tell you the "strength" of each feature. For example, if $\beta_1$ is for "Years of Experience" and $\beta_2$ is for "Commute Time," a much larger $\beta_1$ means experience is a stronger predictor of salary than commute time.
* **$\epsilon$ (Error/Residual):** The vertical distance between the actual data point and the predicted point on the hyperplane.

To solve this for thousands of rows at once, we use **Matrix Notation**:
$$Y = X\beta$$

In this matrix, $X$ is a table of your data. A column of **1s** is added at the very beginning; this allows the math to calculate the intercept ($\beta_0$) alongside the other weights.

### 3. Solving the Equation: Ordinary Least Squares (OLS)
How does the computer find the "perfect" $\beta$? It uses a "closed-form" solution called the **Normal Equation**:
$$\beta = (X^TX)^{-1}X^Ty$$


**The process works like this:**
1.  **$X^T X$:** The computer multiplies the data matrix by its own transpose to create a square matrix.
2.  **$(...)^{-1}$:** It calculates the **Inverse** of that matrix. This is the most "expensive" part of the calculation for a computer's processor.
3.  **The Result:** This formula provides the exact weights that result in the lowest possible error (Minimum Sum of Squared Errors).

### 4. Why "Gradient Descent" is used for Big Data
While the Normal Equation (OLS) gives the *perfect* mathematical answer, it has a major weakness: **Matrix Inversion is slow.**
* If you have 100 features, the computer handles the inversion instantly.
* If you have 100,000 features, calculating the inverse would take an incredibly long time (the complexity is roughly $O(n^3)$).

Because of this, for "Big Data," we use **Gradient Descent**. Instead of calculating the perfect answer in one giant math step, the computer starts with random weights and iteratively "walks down the hill" of the error function until it reaches the bottom.


### Summary Table
| Feature | Simple Linear Regression | Multiple Linear Regression |
| :--- | :--- | :--- |
| **Inputs** | 1 Feature | 2 or More Features |
| **Geometry** | 2D Line | 3D Plane / nD Hyperplane |
| **Formula** | $y = mx + b$ | $y = \beta_0 + \beta_1x_1 + \beta_2x_2 ...$ |
| **Primary Method** | OLS (Normal Equation) | OLS or Gradient Descent |

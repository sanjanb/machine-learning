To understand Multiple Linear Regression (MLR) in detail, it helps to break it down into three perspectives: the **Geometric** (what it looks like), the **Mathematical** (the formula), and the **Computational** (how the computer actually solves it).

### 1. Geometric Intuition: From Lines to Hyperplanes
In Simple Linear Regression, you have one input ($x$) and one output ($y$). You plot these on a 2D graph and find the **"Best Fit Line."**

When you move to **Multiple Linear Regression**, you add more dimensions:
* **2 Inputs ($x_1, x_2$):** Your data points now float in a 3D space (like fireflies in a room). Instead of a line, the "best fit" is a **flat sheet or Plane** that slices through the points. 
* **3+ Inputs:** We can no longer visualize 4D or 5D space, but mathematically, the "plane" becomes a **Hyperplane**. It is a flat surface in higher-dimensional space that tries to stay as close to all data points as possible.

### 2. The Mathematical Formulation
The goal of MLR is to find the coefficients ($\beta$ values) for the following equation:
$$y = \beta_0 + \beta_1x_1 + \beta_2x_2 + ... + \beta_nx_n + \epsilon$$

* **$\beta_0$ (Intercept):** The value of $y$ if all inputs were zero.
* **$\beta_1, \beta_2...$ (Weights):** These tell you the "strength" of each feature. If $\beta_1$ is large, then $x_1$ has a huge impact on the prediction.
* **$\epsilon$ (Error/Residual):** The distance between the actual data point and the predicted point on the hyperplane.

To solve this for thousands of rows at once, we use **Matrix Notation**:
$$Y = X\beta$$

Here, $X$ is a large table of your data, and we add a column of **1s** at the beginning so the math can calculate the intercept ($\beta_0$) automatically.

### 3. Solving the Equation: Ordinary Least Squares (OLS)
How does the computer find the "perfect" $\beta$? It uses a "closed-form" solution called the **Normal Equation**:
$$\beta = (X^TX)^{-1}X^Ty$$


**Breaking down the steps:**
1.  **$X^T X$:** It multiplies the data matrix by its own transpose to create a square matrix.
2.  **$(...)^{-1}$:** it calculates the **Inverse** of that matrix. This is the "hard" part for a computer.
3.  **Result:** This formula gives you the exact weights that result in the lowest possible error (Minimum Sum of Squared Errors).

### 4. Why "Gradient Descent" is often used instead
While the Normal Equation (OLS) gives the *perfect* answer, it has a major weakness: **Matrix Inversion is slow.**
* If you have 100 features, the computer handles the inversion instantly.
* If you have 100,000 features (like in modern AI/LLMs), calculating the inverse of that matrix would take an incredibly long time ($O(n^3)$ complexity).

Because of this, for "Big Data," we use **Gradient Descent**. Instead of calculating the perfect answer in one giant math step, the computer starts with random weights and "walks down the hill" of the error function until it finds the bottom. 

### Summary Table
| Feature | Simple Linear Regression | Multiple Linear Regression |
| :--- | :--- | :--- |
| **Inputs** | 1 Feature | 2+ Features |
| **Geometry** | 2D Line | 3D Plane / nD Hyperplane |
| **Equation** | $y = mx + b$ | $y = \beta_0 + \beta_1x_1 + ...$ |
| **Library Tool** | `LinearRegression` | `LinearRegression` or `SGDRegressor` |

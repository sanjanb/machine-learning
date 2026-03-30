### **1. What is Multiple Linear Regression?**
While Simple Linear Regression involves one input feature ($x$) to predict one output ($y$), MLR involves **multiple input features** ($x_1, x_2, ..., x_n$) 

* **Example (SLR):** Using CGPA to predict LPA.
* **Example (MLR):** Using CGPA, Gender, and IQ to predict LPA.

### **2. Geometric Intuition**
The way we visualize regression changes as we add dimensions:
* **2D (1 Input):** We draw a **Best Fit Line**.
    * **3D (2 Inputs):** We draw a **Best Fit Plane**. The goal is to find a flat surface that minimizes the distance between itself and the floating data points in 3D space .
    * **nD (n Inputs):** In higher dimensions (which we can't visualize), this "surface" is called a **Hyperplane**.

### **3. The Mathematical Equation**
The equation for MLR expands the standard line equation ($y = mx + b$):
* **General Form:** $y = \beta_0 + \beta_1x_1 + \beta_2x_2 + ... + \beta_nx_n$ 
    * **$\beta_0$ (Intercept):** The value of $y$ when all inputs are zero .
    * **$\beta_1, \beta_2, ...$ (Coefficients/Weights):** These represent the "weight" or importance of each feature. For example, if $\beta_1$ (CGPA weight) is much larger than $\beta_2$ (IQ weight), CGPA is a stronger predictor of the output .

### **4. Implementation in Scikit-Learn**
The video demonstrates that despite the added complexity, the code remains almost identical to SLR :
1.  **Import:** `from sklearn.linear_model import LinearRegression`
2.  **Initialize:** `lr = LinearRegression()`
3.  **Train:** `lr.fit(X_train, y_train)` (Note: $X_{train}$ now has multiple columns).
4.  **Coefficients:** You can access the weights using `lr.coef_` (returns an array of $\beta$ values) and the intercept using `lr.intercept_` .

### **Key Takeaway**
Multiple Linear Regression is essentially about finding the best-fitting **Hyperplane** in a high-dimensional space to minimize prediction errors across all features simultaneously.

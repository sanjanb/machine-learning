Standard **Logistic Regression** is a linear classifier, meaning it assumes the data can be separated by a straight line (or hyperplane in higher dimensions). When data is **non-linear**, a standard model will perform poorly.

### 1. The Concept: Nonlinear Logistic Regression
If your data has a circular or complex boundary, a straight line will result in many misclassifications. To fix this, you can use **Polynomial Features** to transform the data into a higher-dimensional space where a linear boundary *can* separate it [[01:23](http://www.youtube.com/watch?v=WnBYW_DX3sM&t=83)].


### 2. How Polynomial Features Work
By adding polynomial terms (squares, cubes, interaction terms) as new features, you allow the model to learn a curved decision boundary.
* **Original Features:** $x_1, x_2$
* **Degree 2 Transformation:** $x_1, x_2, x_1^2, x_2^2, x_1x_2$
* **Degree 3 Transformation:** Adds $x_1^3, x_2^3$, etc.

This process expands the feature set, giving the model more "flexibility" to fit the data.

### 3. Underfitting vs. Overfitting
Choosing the right degree is a balancing act:
* **Low Degree (e.g., Degree 1):** The model is too simple (**Underfitting**). It remains a straight line and fails to capture the pattern.
* **Optimal Degree (e.g., Degree 3 or 5):** The model captures the curve well without being too complex.
* **High Degree (e.g., Degree 10+):** The model becomes too complex (**Overfitting**), chasing every individual data point/noise rather than the general trend.


### 4. Implementation in Scikit-Learn
You can use `PolynomialFeatures` from `sklearn.preprocessing` to transform your data before fitting the model.

```python
from sklearn.preprocessing import PolynomialFeatures
from sklearn.linear_model import LogisticRegression
from sklearn.pipeline import Pipeline

# Creating a pipeline to automate the process
poly = PolynomialFeatures(degree=3)
log_reg = LogisticRegression()

# Transform and then fit
X_poly = poly.fit_transform(X)
log_reg.fit(X_poly, y)
```

### 5. Pros and Cons
* **Pros:** Allows linear models to handle non-linear data; relatively simple to implement.
* **Cons:** Feature space grows very fast (dimensionality issues); often outperformed by algorithms designed for non-linearity, like **Random Forests** or **SVMs**, on real-world complex datasets.

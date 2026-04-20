### 1. The Need for a Loss Function
Previously, we used a loop to randomly pick points and update the line, but this method offers no guarantee of finding the *best* possible line. Machine Learning solves this by defining an **Error (Loss) Function** that quantifies how "wrong" a model is. By minimizing this function, we find the optimal coefficients ($W$).

### 2. Maximum Likelihood Estimation (MLE)
To compare two models, we use the concept of **Likelihood**. 
* For every point, we calculate the probability of it being its actual class (e.g., if a point is Green, what is the probability the model says it's Green?).
* We multiply these probabilities together for all points.
* **The Better Model** is the one with the **Higher Maximum Likelihood**.


### 3. Transition to Log Loss (Binary Cross Entropy)
Multiplying thousands of small probabilities (between 0 and 1) results in an infinitesimally small number that computers struggle to handle (numerical underflow). To solve this:
1. **Apply Logarithm:** We take the `log` of the product, which turns it into a **sum** of logs.
2. **Negative Log:** Since logs of values between 0 and 1 are negative, we multiply by -1 to make the values positive.
3. **Minimization:** While we wanted to *maximize* likelihood, we want to ***minimize*** the resulting **Cross Entropy**.

### 4. The Binary Cross Entropy Formula
The final mathematical formula for the Loss Function ($J$) is:
$$J(W) = -\frac{1}{n} \sum_{i=1}^{n} [y_i \log(\hat{y}_i) + (1 - y_i) \log(1 - \hat{y}_i)]$$

* **When $y_i = 1$:** The second term disappears, leaving only $-\log(\hat{y}_i)$. If the prediction $\hat{y}_i$ is close to 1, the loss is low.
* **When $y_i = 0$:** The first term disappears, leaving $-\log(1 - \hat{y}_i)$. If the prediction $\hat{y}_i$ is close to 0, the loss is low.


### 5. Next Steps: Optimization
Unlike Linear Regression, this equation has no "closed-form" algebraic solution (you can't just solve for $W$ with a single formula). The only way to find the minimum is through an iterative optimization technique called **Gradient Descent**, which is covered in the next part of the series.

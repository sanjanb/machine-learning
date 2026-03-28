### **1. Mean Absolute Error (MAE)**
MAE calculates the average of the absolute differences between actual and predicted values.
* **Formula:** $\frac{1}{n} \sum_{i=1}^{n} |y_i - \hat{y}_i|$ 
* **Key Advantage:** The resulting number is in the same unit as the output variable (e.g., LPA for salary), making it easy to interpret. It is also relatively robust to outliers 
* **Disadvantage:** The absolute function is not differentiable at zero, which can cause issues with optimization algorithms like Gradient Descent 

### **2. Mean Squared Error (MSE)**
MSE squares the errors before averaging them.
* **Formula:** $\frac{1}{n} \sum_{i=1}^{n} (y_i - \hat{y}_i)^2$ 
* **Key Advantage:** It is a differentiable function, making it ideal as a loss function for optimization 
* **Disadvantage:** The units are squared (e.g., $LPA^2$), making it hard to interpret intuitively. Additionally, it heavily penalizes outliers because the squaring effect magnifies large errors 

### **3. Root Mean Squared Error (RMSE)**
RMSE is simply the square root of MSE, brought back to the original units of the data.
* **Formula:** $\sqrt{\frac{1}{n} \sum_{i=1}^{n} (y_i - \hat{y}_i)^2}$
* **Benefit:** It combines the differentiability of MSE with the interpretability of MAE (same units as the output) 

### **4. R-Squared ($R^2$) Score**
Also known as the **Coefficient of Determination**, it compares your model's performance against a "baseline" model (the mean of the output) 
* **Interpretation:** An $R^2$ of 0.80 means that 80% of the variance in the output is explained by the input features 
    * **$R^2 = 1$:** Perfect model (no errors)
    * **$R^2 = 0$:** Model is no better than just predicting the average
    * **Negative $R^2$:** The model is performing worse than the simple mean 


### **5. Adjusted R-Squared**
Standard $R^2$ has a flaw: adding any new feature (even a random/useless one) will usually increase the $R^2$ score. Adjusted $R^2$ penalizes the addition of irrelevant features.
* **Logic:**
    * If you add a **relevant** feature, Adjusted $R^2$ increases 
    * If you add an **irrelevant** feature (e.g., "outside temperature" for predicting salary), Adjusted $R^2$ decreases 

### **Practical Implementation**
The video demonstrates using `scikit-learn` to calculate these metrics 
* `mean_absolute_error(y_test, y_pred)`
* `mean_squared_error(y_test, y_pred)`
* `r2_score(y_test, y_pred)`
* For **RMSE**, use `np.sqrt(mean_squared_error(...))` 

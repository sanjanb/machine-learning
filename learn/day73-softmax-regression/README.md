**Softmax Regression**, also known as **Multinomial Logistic Regression**, is an extension of Logistic Regression used for **Multi-class Classification** (predicting one of more than two classes, e.g., Setosa vs. Versicolor vs. Virginica) [[00:27](http://www.youtube.com/watch?v=Z8noL_0M4tw&t=27)].

### 1. The Softmax Function
In binary logistic regression, we use the Sigmoid function. In Softmax regression, we use the **Softmax function** to calculate the probability for each class $k$.
The formula for a specific class $i$ is:
$$\sigma(z)_i = \frac{e^{z_i}}{\sum_{j=1}^{K} e^{z_j}}$$
* **Key Properties:**
    * Each output probability is between 0 and 1.
    * The sum of all class probabilities for a single input is **always 1**.


### 2. How Training Works (Intuition)
One way to think about it is "One-vs-Rest" (OvR):
1.  Transform the target column using **One-Hot Encoding** (e.g., Class 0, 1, and 2 become three binary columns).
2.  Train a separate binary logistic regression model for each class.
3.  Each model calculates its own score ($z$).
4.  Feed these scores into the Softmax function to get final probabilities.

### 3. Loss Function: Cross-Entropy
Instead of the standard Log-Loss used in binary classification, Softmax uses **Categorical Cross-Entropy Loss**. 
* It penalizes the model more when it predicts a low probability for the correct class.
* Training involves finding the weights ($w$) that minimize this total loss using **Gradient Descent**.


### 4. Implementation in Scikit-Learn
You can use the standard `LogisticRegression` class, but you must specify the `multi_class` parameter.
```python
from sklearn.linear_model import LogisticRegression

# multi_class='multinomial' triggers Softmax Regression
model = LogisticRegression(multi_class='multinomial', solver='lbfgs')
model.fit(X_train, y_train)

# To see probabilities instead of just the class
probs = model.predict_proba(X_test) 
```

### 5. Prediction
For a new data point, the model calculates a score ($z$) for every class, converts them to probabilities via Softmax, and assigns the class with the **highest probability**.

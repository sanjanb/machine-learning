### 1. Why Regression Trees?

While Linear Regression works well for linear data, it fails to capture complex, non-linear relationships. Regression Trees handle non-linearity by partitioning the data into smaller, simpler regions where the output is predicted as the **mean** of the samples in that region.


### 2. How Regression Trees Work

The algorithm recursively splits the data into branches based on feature values, similar to classification trees.

* **Splitting Criterion:** Instead of Gini Impurity or Entropy, Regression Trees use **Mean Squared Error (MSE)** or **Variance Reduction**.
* **Goal:** Find splits that minimize the total variance within each resulting child node.
* **Leaf Node Value:** Once a stopping criterion is met, the prediction for any sample falling into that leaf is the **average value** of all training samples in that node.

### 3. Step-by-Step Splitting Process

1. **Iterate through all features.**
2. **For each feature, sort the values and find all possible split points** (usually the midpoint between adjacent values).
3. **Calculate the MSE** for each split point. The split that results in the lowest combined MSE for the left and right nodes is chosen.
4. **Repeat** this process until a stopping condition is met.

### 4. Hyperparameters and Overfitting

Regression Trees are prone to heavy overfitting (high variance) if not constrained. Key hyperparameters to tune include:

* **max_depth:** Limits how deep the tree grows.
* **min_samples_split:** Minimum number of samples required to split a node.
* **min_samples_leaf:** Minimum number of samples required to be in a leaf node.
* **ccp_alpha:** Used for **Pruning** the tree after it has fully grown to simplify it and improve generalization.

### 5. Implementation and Evaluation

In Scikit-Learn, you use `DecisionTreeRegressor`. Common evaluation metrics for these models include **MSE** (Mean Squared Error), **MAE** (Mean Absolute Error), and the **R² score**.

```python
from sklearn.tree import DecisionTreeRegressor
regressor = DecisionTreeRegressor(max_depth=5)
regressor.fit(X_train, y_train)

```

### 6. Feature Importance [[33:48](http://www.youtube.com/watch?v=RANHxyAvtM4&t=2028)]

Like classification trees, Regression Trees provide a `feature_importances_` attribute. It ranks features based on how much they reduce the total variance across all nodes where they were used for splitting.

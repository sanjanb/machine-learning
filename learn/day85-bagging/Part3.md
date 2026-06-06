## 1. Regression vs. Classification Architecture

The structural mechanism for row and feature subsampling remains identical across the bagging pipeline. The fundamental variance lies entirely in the final layer:

* **Classification (Review):** Aggregates predictions from homogeneous base models using **Majority Voting (Mode)**.
* **Regression:** Because the base estimators output continuous real numbers rather than categorical labels, the ensemble aggregates predictions by calculating the mathematical **Mean (Average)** of all base estimator outputs:

$$\hat{y}_{ensemble} = \frac{1}{N} \sum_{i=1}^{N} M_i(X)$$



Every subset alternative—**Bagging, Pasting, Random Subspaces, and Random Patches**—applies to continuous estimation problems just as it does to discrete classifiers.

---

## 2. Interactive Prediction Line Visualization

An interactive curve utility highlights why a Bagging Regressor stabilizes localized variance errors:

* **Standalone Decision Tree Regressor:** The single-tree estimation frontier generates sharp, disjointed "steps." It displays high variance by matching training points perfectly (overfitting), tracking anomalies, and creating rigid intervals.
* **Bagging Regressor:** Averaging predictions across multiple bootsrapped decision trees smooths out these jagged steps into a continuous curve. This reduces high variance while maintaining low bias, allowing the meta-model to capture the true global distribution trend instead of tracking localized noise.

---

## 3. Structural Implementation Code

The following implementation trains a `BaggingRegressor` on a continuous target matrix using `scikit-learn`:

```python
import numpy as np
from sklearn.datasets import fetch_openml
from sklearn.model_selection import train_test_split, GridSearchCV
from sklearn.linear_model import LinearRegression
from sklearn.tree import DecisionTreeRegressor
from sklearn.ensemble import BaggingRegressor
from sklearn.metrics import r2_score

# 1. Load data matrix (e.g., Boston housing or alternative continuous target dataset) [00:05:43]
boston = fetch_openml(name="boston", version=1, as_frame=True, parser="auto")
X, y = boston.data, boston.target
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42) [00:06:27]

# 2. Benchmark standalone baseline models [00:06:34]
lr = LinearRegression().fit(X_train, y_train)
dt = DecisionTreeRegressor(random_state=42).fit(X_train, y_train)

print(f"Linear Regression R2: {r2_score(y_test, lr.predict(X_test)):.4f}") [00:06:47]
print(f"Standalone DT Regressor R2: {r2_score(y_test, dt.predict(X_test)):.4f}")

# 3. Deploy basic Bagging Regressor ensemble [00:06:55]
bag_reg = BaggingRegressor(
    estimator=DecisionTreeRegressor(),
    n_estimators=100,
    max_samples=1.0,
    bootstrap=True,
    random_state=42
)
bag_reg.fit(X_train, y_train)
print(f"Vanilla Bagging Regressor R2: {r2_score(y_test, bag_reg.predict(X_test)):.4f}") [00:07:11]

```

---

## 4. Hyperparameter Tuning using Grid Search

Since manual tuning can be inefficient, hyperparameter cross-validation is used to optimize parameter distributions across structural targets:

```python
# Setup parameters grid evaluating multiple estimator foundations [00:07:48]
param_grid = {
    'estimator': [DecisionTreeRegressor(), LinearRegression()],
    'n_estimators': [20, 50, 100],
    'max_samples': [0.5, 1.0],
    'max_features': [0.5, 1.0],
    'bootstrap': [True, False],
    'bootstrap_features': [True, False]
} [00:07:55]

# Initialize multi-threaded optimization search [00:08:38, 00:08:49]
grid_search = GridSearchCV(
    estimator=BaggingRegressor(),
    param_grid=param_grid,
    cv=5,
    n_jobs=-1,          # Utilize all local CPU cores [00:08:49]
    verbose=1           # Print task steps during calculation [00:09:01]
)

grid_search.fit(X_train, y_train)

print(f"Optimal Grid R2 Validation Score: {grid_search.best_score_:.4f}") [00:09:20]
print(f"Optimal Structural Configuration parameters: {grid_search.best_params_}") [00:09:23]

```

### Optimal Grid Configuration Outputs

When processing standard tabular matrices, the optimal settings discovered by `GridSearchCV` typically conform to the following baseline profile:

* **`estimator`**: `DecisionTreeRegressor()`
* **`bootstrap`**: `True` (Row-wise bagging is active)
* **`bootstrap_features`**: `False` (Disables feature column replication duplication)
* **`max_samples`**: `1.0` or `0.75` (Utilizes substantial row counts for baseline regression validation steps)
* **`max_features`**: `1.0` (Keeps entire feature width when column dimension count is low)

# KNN Imputer: Multivariate Imputation

KNN Imputer is a multivariate imputation technique that uses the K-Nearest Neighbors algorithm to fill missing values by looking at the most similar rows in the dataset.


## Overview

Unlike univariate methods (Mean/Median) that only look at a single column, KNN Imputer considers the relationships between all features. It finds the "K" most similar rows to the one with the missing value and uses their values to estimate the gap.

## Techniques Covered

### 1. Distance Calculation (NaN-Euclidean Distance)

* **Concept:** Standard Euclidean distance fails when data is missing. KNN Imputer uses a modified version called **NaN-Euclidean Distance**.
* **Formula:** The distance is calculated only using the coordinates (features) that are present in both rows, then scaled up by the ratio of total features to present features.
* **Logic:** $Weight = \frac{\text{Total Coordinates}}{\text{Present Coordinates}}$. This ensures that pairs with more missing values aren't unfairly perceived as "closer" just because they have fewer dimensions to compare.

### 2. K-Neighbors Averaging

* **Concept:** Once the $K$ closest rows (neighbors) are found, the missing value is filled using the average of those neighbors' values for that specific column.
* **Weighting Options:**
* **Uniform:** All $K$ neighbors contribute equally to the average.
* **Distance:** Closer neighbors have a higher influence on the result than neighbors further away (using the reciprocal of their distance).




## Implementation Details

### Using Scikit-Learn (KNNImputer)

This is the standard implementation for integrating KNN imputation into a machine learning workflow.

```python
from sklearn.impute import KNNImputer

# Initialize imputer
# n_neighbors: number of neighbors to consider
# weights: 'uniform' or 'distance'
imputer = KNNImputer(n_neighbors=5, weights='distance', add_indicator=True)

# Fit and transform the data
X_train_imputed = imputer.fit_transform(X_train)

```

---

## Evaluation Metrics

1. **Accuracy vs. Simple Imputers:** Compare the cross-validation scores of a model trained on KNN-imputed data versus Mean/Median-imputed data. KNN often outperforms simple methods on small to medium datasets.
2. **Imputation Time:** Monitor the time taken for `fit_transform`. KNN is computationally expensive ($O(n^2)$) and can be significantly slower than simple imputation.
3. **Memory Usage:** Ensure the deployment environment can handle storing the entire training set, as it is required to calculate distances for new incoming data.

## Key Takeaways

* **Multivariate Advantage:** KNN Imputer is generally more accurate because it captures local patterns and correlations between features.
* **The "K" Factor:** The choice of $K$ is a hyperparameter. A small $K$ can be noisy, while a very large $K$ starts behaving like Mean imputation.
* **Scaling Requirement:** Because KNN relies on Euclidean distance, it is highly sensitive to the scale of the data. Always **Scale/Normalize** your data before applying KNN Imputer.
* **Production Trade-off:** Use KNN when accuracy is the top priority and the dataset size is manageable. Avoid it for massive datasets where real-time inference speed is critical.

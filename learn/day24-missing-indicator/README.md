# Advanced Simple Imputation: Random Sample, Missing Indicators, and GridSearch

This guide covers specialized univariate imputation techniques and how to automatically select the best imputation parameters using Scikit-Learn.

---

## Overview

While Mean, Median, and Mode are standard, advanced simple techniques like **Random Sample Imputation** and **Missing Indicators** can better preserve data distribution or signal "missingness" to the model. Additionally, **GridSearchCV** allows for automated selection of the most effective strategy.

## Imputation Techniques Covered

### 1. Random Sample Imputation

* **Concept:** Replacing missing values with a random observation from the available data in that same column.
* **When to use:** Effective for linear models where preserving the original distribution shape and variance is critical.
* **Pros:** Maintains the distribution variance and PDF shape almost perfectly. Works for both numerical and categorical data.
* **Cons:** Introduces randomness (can lead to different results for the same input unless a seed is used). Not ideal for tree-based models. Memory-heavy in production because the training set must be stored to sample from.

### 2. Missing Indicator

* **Concept:** Creating a binary auxiliary column (True/False) for every feature that has missing data.
* **Logic:** If `Age` is missing, `Age_nan` becomes 1 (True); otherwise, it is 0 (False).
* **Why it works:** It allows the model to learn if the "missingness" itself has predictive power (e.g., people not reporting income might belong to a specific high-income bracket).
* **Implementation:** In Scikit-Learn, set `add_indicator=True` within `SimpleImputer`.

### 3. Automated Parameter Selection (GridSearchCV)

* **Concept:** Instead of guessing if "Mean" or "Median" is better, use a search grid to test all combinations.
* **Process:** Wrap the imputer in a `Pipeline`, then use `GridSearchCV` to evaluate which strategy yields the highest model accuracy (e.g., LogReg or Random Forest).

---

## Implementation Details

### A. Random Sample Imputation (Manual Pandas)

```python
# Extract random samples
random_sample = df['Age'].dropna().sample(df['Age'].isnull().sum())

# Assign index to match the missing values
random_sample.index = df[df['Age'].isnull()].index

# Fill values
df.loc[df['Age'].isnull(), 'Age'] = random_sample

```

### B. Missing Indicator & GridSearch (Scikit-Learn)

```python
from sklearn.impute import SimpleImputer
from sklearn.model_selection import GridSearchCV
from sklearn.pipeline import Pipeline

# Pipeline with Indicator
pipe = Pipeline([
    ('imputer', SimpleImputer(add_indicator=True)),
    ('classifier', LogisticRegression())
])

# Param Grid for Strategy
param_grid = {
    'imputer__strategy': ['mean', 'median'],
    'imputer__add_indicator': [True, False]
}

grid = GridSearchCV(pipe, param_grid, cv=5)
grid.fit(X_train, y_train)
print(f"Best Strategy: {grid.best_params_}")

```

---

## Evaluation Metrics

1. **Distribution Overlap:** Use KDE plots to ensure the imputed distribution hasn't spiked at a single value (common with Mean/Median).
2. **Covariance Check:** Check if relationships between features (e.g., Age vs. Fare) are preserved. Random sampling usually performs better here than Mean/Median.
3. **Model Performance:** Use Cross-Validation scores to determine if the Missing Indicator actually helps the model distinguish between patterns.

## Key Takeaways

* **Random Sample Imputation** is the best "simple" way to keep your distribution's shape, but it is hard to deploy.
* **Missing Indicator** is a "hidden gem" that often boosts accuracy in competitive machine learning (Kaggle-style).
* Use **GridSearchCV** to let the data decide which imputation strategy is best rather than following a fixed rule.

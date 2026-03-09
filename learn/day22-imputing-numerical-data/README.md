# Handling Missing Numerical Data: Simple Imputation

This repository contains implementations and conceptual explanations of various univariate imputation techniques for numerical data.



## Overview

The goal of imputation is to fill missing values (NaN) in a dataset without removing entire rows, ensuring that machine learning models can process the complete data.

## Imputation Techniques Covered

### 1. Mean/Median Imputation

* **Concept:** Replacing missing values with the average (Mean) or middle value (Median) of the column.
* **When to use:** When data is Missing Completely at Random (MCAR).
* **Mean:** Use if the distribution is Normal (Gaussian).
* **Median:** Use if the distribution is skewed or contains outliers.


* **Pros:** Simple to implement, easy to deploy.
* **Cons:** Distorts the original distribution shape, changes variance/covariance, and can create artificial outliers.

### 2. Arbitrary Value Imputation

* **Concept:** Replacing missing values with an arbitrary number (such as -1, 99, or 999) that does not exist in the actual data range.
* **Purpose:** To explicitly signal to the model that the data was missing, creating a distinction between observed and missing values.
* **When to use:** When data is not missing at random.

### 3. End of Distribution Imputation

* **Concept:** An extension of arbitrary imputation where the value is mathematically selected from the far end of the distribution.
* **Selection Logic:**
* **Normal Distribution:** Use $Mean \pm 3 \times Standard Deviation$.
* **Skewed Distribution:** Use the Interquartile Range (IQR) proximity rule ($Q3 + 1.5 \times IQR$ or $Q1 - 1.5 \times IQR$).



---

## Implementation Details

### A. Using Pandas (fillna)

Useful for quick data analysis.

```python
# Median Imputation
df['age_median'] = df['age'].fillna(df['age'].median())

# Arbitrary Value Imputation
df['age_99'] = df['age'].fillna(99)

```

### B. Using Scikit-Learn (SimpleImputer)

The standard method for machine learning pipelines.

```python
from sklearn.impute import SimpleImputer
from sklearn.compose import ColumnTransformer

# Define imputers
imputer1 = SimpleImputer(strategy='median')
imputer2 = SimpleImputer(strategy='mean')

# Apply to specific columns
trf = ColumnTransformer([
    ('impute_age', imputer1, ['age']),
    ('impute_fare', imputer2, ['fare'])
], remainder='passthrough')

```

---

## Evaluation Metrics

After imputation, verify the impact on the dataset:

1. **Variance Check:** Observe if the variance shrinks significantly.
2. **Distribution Plot (PDF):** Compare the KDE plots before and after imputation to check for distribution shifts.
3. **Covariance/Correlation:** Check if the relationship between features has been distorted.
4. **Boxplots:** Identify if the imputation has created pseudo-outliers.

## Key Takeaways

* Always perform Train-Test Split before imputation to avoid data leakage.
* If missing data is less than 5%, Mean/Median imputation is usually safe.
* If distributions change drastically, consider advanced techniques like KNN Imputer or Iterative Imputer.

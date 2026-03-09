# Handling Missing Categorical Data: Simple Imputation

This tutorial focuses on techniques for filling missing values in categorical columns using simple univariate imputation strategies.

---

## Overview

Categorical data requires different logic than numerical data because mathematical operations like "average" cannot be applied to strings. Instead, we use the most frequent category (Mode) or treat the absence of data as its own category.

## Imputation Techniques Covered

### 1. Most Frequent Imputation (Mode)

* **Concept:** Replacing missing values with the category that appears most often in the column.
* **When to use:** When data is Missing Completely at Random (MCAR) and the missing values are less than 5% of the total data.
* **Requirement:** One category should ideally dominate the others significantly.
* **Pros:** Simple to implement and deploy.
* **Cons:** Distorts the distribution of the categories, especially if many values are missing. It can over-represent the most frequent class.

### 2. Missing Category Imputation

* **Concept:** Creating a completely new category named "Missing" (or any label) to replace all NaN values.
* **Purpose:** To explicitly inform the machine learning model that the data was missing, effectively treating "missingness" as a feature.
* **When to use:** When a significant portion of the data is missing (e.g., >10%) or when the data is not missing at random.
* **Pros:** Preserves the original distribution of the existing categories.
* **Cons:** Adds an extra category to the feature, which might increase dimensionality during one-hot encoding.

---

## Implementation Details

### A. Using Pandas (fillna)

Simple approach for data exploration.

```python
# Most Frequent Imputation
mode_val = df['GarageQual'].mode()[0]
df['GarageQual_imputed'] = df['GarageQual'].fillna(mode_val)

# Missing Category Imputation
df['FireplaceQu_imputed'] = df['FireplaceQu'].fillna('Missing')

```

### B. Using Scikit-Learn (SimpleImputer)

Better for production pipelines to ensure consistency between training and testing data.

```python
from sklearn.impute import SimpleImputer

# Most Frequent Strategy
imputer_mode = SimpleImputer(strategy='most_frequent')
X_train_mode = imputer_mode.fit_transform(X_train)

# Constant Strategy (Missing Category)
imputer_const = SimpleImputer(strategy='constant', fill_value='Missing')
X_train_const = imputer_const.fit_transform(X_train)

```

---

## Evaluation Metrics

To verify if categorical imputation was successful:

1. **Frequency Change:** Check the value counts before and after. If the Mode category jumps drastically in percentage, it may negatively affect the model.
2. **PDF/KDE Comparison (via Target):** Plot the distribution of the target variable (e.g., SalePrice) for the specific category before and after imputation. If the curves diverge significantly, the imputation might be adding noise.
3. **Observation of Dominance:** If multiple categories have similar frequencies, using "Most Frequent" is risky as it arbitrarily picks one to boost.

## Key Takeaways

* Use **Most Frequent** if the missing data is minimal (<5%) and one category is clearly dominant.
* Use **Missing Category** if the missing data is substantial (like 50% in the Fireplace Quality example) to avoid forcing a false distribution.
* Always evaluate the impact of imputation on the relationship between the feature and the target variable.

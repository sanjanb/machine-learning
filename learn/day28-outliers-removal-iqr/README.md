# Outlier Detection and Removal: IQR Method

The **Interquartile Range (IQR) method** is the preferred technique for identifying outliers when your data is **Skewed** (not normally distributed).


## Key Concepts

To use this method, you need to understand the components of a **Box Plot**:

* **Q1 (25th Percentile):** 25% of the data falls below this value.
* **Q3 (75th Percentile):** 75% of the data falls below this value.
* **IQR:** The range between the 25th and 75th percentiles ($IQR = Q3 - Q1$).

### The IQR Proximity Rule

Based on the IQR, we calculate "whiskers" or boundaries. Any data point outside these boundaries is flagged as an outlier:

* **Upper Limit** = $Q3 + 1.5 \times IQR$
* **Lower Limit** = $Q1 - 1.5 \times IQR$

---

## Step-by-Step Implementation

### 1. Calculate IQR

Using Pandas, you can find the percentiles and compute the range:

```python
q1 = df['column'].quantile(0.25)
q3 = df['column'].quantile(0.75)
iqr = q3 - q1

```

### 2. Define Boundaries

```python
upper_limit = q3 + 1.5 * iqr
lower_limit = q1 - 1.5 * iqr

```

### 3. Handle Outliers

#### **Trimming (Removal)**

Delete rows where the value is outside the limits.

```python
new_df = df[(df['column'] < upper_limit) & (df['column'] > lower_limit)]

```

#### **Capping (Winsorization)**

Replace outlier values with the boundary values so you don't lose data rows.

```python
df['column'] = np.where(df['column'] > upper_limit, upper_limit,
               np.where(df['column'] < lower_limit, lower_limit, df['column']))

```

---

## Comparison: Z-Score vs. IQR

| Feature | Z-Score Method | IQR Method |
| --- | --- | --- |
| **Data Distribution** | Normal / Gaussian | **Skewed** |
| **Boundary Logic** | Mean $\pm$ 3 Std Dev | Q1/Q3 $\pm$ 1.5 IQR |
| **Sensitivity** | Sensitive to extreme values (pulls the mean) | Robust (Median and Percentiles are less affected) |

## Key Takeaway

If you see a "tail" in your distribution plot (PDF) or if your data has a high skewness score, use the **IQR method**. It is a robust way to clean your data without making strong assumptions about the underlying distribution.

# Outlier Detection and Removal: Percentile Method

The **Percentile Method** (also known as the **Thresholding Method**) is one of the simplest and most flexible ways to handle outliers. Unlike the Z-score or IQR methods, it doesn't rely on strict statistical formulas like standard deviation or quartiles. Instead, you manually define a "cutoff" percentile.


## Core Concept

In this method, you decide that a certain top and bottom percentage of your data are outliers.

* **Common Choice:** The 1st percentile and the 99th percentile.
* **Upper Limit:** The value at the 99th percentile (99% of data is below this).
* **Lower Limit:** The value at the 1st percentile (only 1% of data is below this).


* Any value above the 99th or below the 1st percentile is flagged as an outlier. 

## Handling Outliers

### 1. Trimming (Removal)

You simply filter the dataset to keep only the rows within your chosen range (e.g., between the 1st and 99th percentile).

* **Example:** If you have 10,000 rows and use 1% as your cutoff for both ends, you will remove 200 rows total.

### 2. Capping (Winsorization)

In the context of the percentile method, capping is formally called **Winsorization**. 
* Instead of deleting the data, you replace the extreme values with the boundary values.
* **Example:** If the 99th percentile value is 74.8, any value like 76 or 80 is changed to exactly 74.8.



## How to Implement (Python/Pandas)

### Step 1: Calculate the Thresholds

```python
upper_limit = df['column'].quantile(0.99)
lower_limit = df['column'].quantile(0.01)

```

### Step 2: Apply Winsorization (Capping)

Using `np.where` is the most efficient way to perform this multi-step replacement:

```python
df['column'] = np.where(df['column'] >= upper_limit, upper_limit,
               np.where(df['column'] <= lower_limit, lower_limit, 
               df['column']))

```

---

## When to Use This Method?

* **Non-Parametric Data:** When your data doesn't follow a normal distribution and the IQR method isn't giving you the results you want.
* **Extreme Flexibility:** It allows you to be as strict (e.g., 0.5% cutoff) or as loose (e.g., 5% cutoff) as your specific use case requires. 
* **Domain Knowledge:** Useful when you know that a certain percentage of records are likely "noise" or measurement errors.

## Key Takeaway

The Percentile Method is great because it **guarantees** the removal of outliers based on your specific business rules. However, be careful not to set the threshold too high (like 5% or 10%) unless you are certain that much of your data is truly erroneous, as you could be losing valuable information.


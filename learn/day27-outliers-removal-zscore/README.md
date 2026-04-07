# Outlier Detection and Removal: Z-score Method

The **Z-score method** is a powerful statistical technique used to identify and handle outliers in features that follow a **Normal (Gaussian) Distribution**.



## The Empirical Rule (68-95-99.7)

In a normal distribution, data points are distributed predictably around the mean ($\mu$):

* **68%** of data falls within **1 standard deviation** ($\sigma$) of the mean.
* **95%** of data falls within **2 standard deviations**.
* **99.7%** of data falls within **3 standard deviations**.

**The Assumption:** Any data point that lies beyond **3 standard deviations** from the mean is considered an outlier, as it represents only 0.3% of the total population.

## How it Works

1. **Check Distribution:** Ensure the feature is normally distributed (or close to it).
2. **Calculate Limits:**
* **Upper Limit** = $\mu + 3\sigma$
* **Lower Limit** = $\mu - 3\sigma$


3. **Identify Outliers:** Any value $> \text{Upper Limit}$ or $< \text{Lower Limit}$ is an outlier. [

Alternatively, you can calculate the **Z-score** for every data point:


$$Z = \frac{x - \mu}{\sigma}$$


If $|Z| > 3$, the point is an outlier.



## Outlier Treatment Techniques

### 1. Trimming (Removal)

* **Concept:** Simply delete the rows that contain outliers.
* **When to use:** When the number of outliers is small relative to the total dataset.
* **Implementation:** ```python
new_df = df[(df['col'] < upper_limit) & (df['col'] > lower_limit)]
```


```



### 2. Capping (Winsorization)

* **Concept:** Instead of deleting the outliers, "cap" them at the boundary values.
* If a value is $> \text{Upper Limit}$, replace it with the Upper Limit.
* If a value is $< \text{Lower Limit}$, replace it with the Lower Limit.


* **Implementation:**
```python
df['col'] = np.where(df['col'] > upper_limit, upper_limit,
            np.where(df['col'] < lower_limit, lower_limit, df['col']))

```





## Pros and Cons

| Pros | Cons |
| --- | --- |
| Very easy to implement. | **Strict Requirement:** Only works on normally distributed data.  |
| Statistically sound for Gaussian data. | Sensitive to the mean; extreme outliers can "pull" the mean, making them harder to detect. |

## Key Takeaway

Always visualize your data first (e.g., using a Histogram or Distplot). If the data is **skewed**, do not use the Z-score method; instead, use the **IQR (Interquartile Range) method**, which we will cover next!

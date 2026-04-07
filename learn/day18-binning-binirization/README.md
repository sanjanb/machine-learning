# Data Transformation: Numerical to Categorical

In many machine learning scenarios, continuous numerical data can be noisy or contain outliers that mislead a model. Transforming these into discrete categories (bins) can often improve model robustness and interpretability.


## 1. Discretization (Binning)

**Discretization** is the process of transforming continuous variables into discrete variables by creating a set of contiguous intervals (bins) that span the range of the variable's values.

### Why use Discretization?

* **Handle Outliers:** By grouping extreme values into a single bin (e.g., "High"), the model is less sensitive to exact outlier values.
* **Improve Value Spread:** It helps in linear models to capture non-linear relationships by treating intervals as separate features.
* **Data Simplification:** Reduces the complexity of the feature space.


## 2. Unsupervised Binning

Unsupervised binning does not take the target variable ($y$) into account; it only looks at the distribution of the feature ($X$).

### A. Equal Width Binning (Uniform)

Divides the range of the variable into $N$ bins of equal size.

* **Formula for width:** $w = \frac{\text{max} - \text{min}}{N}$
* **Best for:** Data that is uniformly distributed.
* **Cons:** Very sensitive to outliers (one outlier can stretch the width of all other bins).

### B. Equal Frequency Binning (Quantile)

Each bin contains approximately the same number of observations.

* **Mechanism:** Uses percentiles/quantiles to set boundaries.
* **Best for:** Skewed data. It spreads out the dense clusters and compresses the sparse tail.

### C. K-Means Binning

Uses the K-Means clustering algorithm to find groups in the 1D data.

* **Mechanism:** Each bin center is a centroid found by the algorithm. Observations are assigned to the nearest centroid.
* **Best for:** Finding "natural" clusters in the data.
---

## 3. Supervised Binning

Supervised binning uses the relationship with the target variable to define the boundaries.

### Decision Tree Binning

* **Mechanism:** A Decision Tree is trained using the single continuous feature to predict the target. The "splits" created by the tree become the boundaries for the bins.
* **Advantage:** It creates bins that are highly predictive of the target class.

---

## 4. Custom Binning

Sometimes, domain knowledge is better than any algorithm.

* **Example:** Converting "Age" into:
* $0-12$: Child
* $13-19$: Teen
* $20-60$: Adult
* $60+$: Senior



---

## 5. Binarization

Binarization is a special case of discretization where the data is split into exactly **two** categories (0 and 1) based on a threshold.

* **Logic:**
$$x' = \begin{cases} 1 & \text{if } x > \text{threshold} \\ 0 & \text{if } x \leq \text{threshold} \end{cases}$$


* **Use Case:** Common in Image Processing (turning grayscale to Black/White) or turning "Number of times a user clicked" into "Did the user click at least once?" (0 or 1).


```

Would you like me to create a practical Python example comparing **Equal Width** vs **Equal Frequency** on a skewed dataset like the Titanic "Fare" column?

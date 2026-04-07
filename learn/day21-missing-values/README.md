

### 1. Types of Missing Data Handling

* **Removal:** Deleting the rows or columns containing missing values (Complete Case Analysis).
* **Imputation:** Filling in the missing values.
* **Univariate:** Filling a column based on its own statistics (Mean, Median, Mode).
* **Multivariate:** Using other columns to predict the missing value (KNN Imputer, Iterative Imputer).



### 2. What is Complete Case Analysis (CCA)?

CCA (also known as "listwise deletion") consists of discarding observations (rows) where values in any of the variables (columns) are missing. You only analyze the "complete cases."
### 3. The Critical Assumption: MCAR

You should only use CCA if the data is **Missing Completely At Random (MCAR)**.

* If data is missing randomly, removing those rows won't change the overall distribution of the dataset.
* If data is missing due to a specific pattern (e.g., only high-income people skipped the "Salary" question), removing those rows will bias your model.

---

1. **Check Missing Percentage:** Calculate the `%` of missing values per column.
2. **Filter Columns:** Select columns where missing data is $< 5\%$.
3. **Perform Drop:** Use `df.dropna(subset=['col1', 'col2'])`.
4. **Verify Distribution:**
* **Numerical Data:** Plot Histograms/PDFs of the data *before* and *after* CCA to ensure they overlap.
* **Categorical Data:** Check if the ratio of categories (e.g., % of graduates vs. % of masters) remains the same after dropping rows.

# Overview of Principal Component Analysis (PCA) - Part 3

This video by CampusX provides a comprehensive practical implementation of PCA using the MNIST dataset, covering coding, visualization, and advanced concepts like explaining variance.



## 1. Practical Implementation on MNIST 
* **Dataset:** The MNIST dataset consists of 42,000 images of handwritten digits (0-9).
* **Structure:** Each image is $28 \times 28$ pixels, flattened into **784 columns** (features). 
* **Goal:** Use PCA to reduce the 784 dimensions to a manageable number while retaining accuracy.

## 2. Baseline Performance (Without PCA)
* **Algorithm:** K-Nearest Neighbors (KNN) was used as the classifier.
* **Observation:** KNN on 784 dimensions is computationally expensive and slow because it calculates distances in a high-dimensional space.
* **Accuracy:** Reached approximately **96.7%** but took significant time to process.

## 3. Applying PCA for Dimensionality Reduction 
* **Step 1: Standardization:** Data must be centered using `StandardScaler` before applying PCA.
* **Step 2: Transformation:**
    * Reduced the data from **784 dimensions to 100 dimensions**.
    * **Accuracy with 100 components:** ~95.3% (Slight drop in accuracy, but massive gain in speed).]
* **Key takeaway:** PCA significantly reduces computation time by decreasing the number of features.

## 4. Visualizing High-Dimensional Data 
* **2D Visualization:** PCA was used to reduce the data to 2 components. While some classes overlap, distinct clusters for digits like '0' and '1' start to appear. 
* **3D Visualization:** Reducing to 3 components provides a better "snapshot" of the data. 
    * **Observations:** Digits that look similar (like 3 and 8) appear close to each other in the 3D space, while dissimilar digits (like 0 and 7) are far apart. 

## 5. Choosing the Optimum Number of Components
* **Eigenvalues & Variance:** Each principal component explains a certain percentage of the "variance" (information) of the original data.
* **Cumulative Variance:** By plotting the cumulative sum of the `explained_variance_ratio_`, you can find the "elbow point."
* **Rule of Thumb:** Usually, you should aim to retain enough components to explain **90-95% of the variance**. For MNIST, around 200-300 components capture ~90% of the information. 

## 6. When PCA Fails 
PCA is powerful but has limitations:
1.  **Equal Variance:** If variance is spread equally across all axes (e.g., circular data), PCA cannot find a "best" axis to drop. 
2.  **Information Loss in Projection:** If data is clustered in a way that projection causes heavy overlapping, the classes become indistinguishable.     
3.  **Complex Patterns:** PCA captures linear relationships. If the data follows a complex non-linear pattern (like a sine wave), PCA may lose that structural information. 

---

**Summary:** This lecture transitions from theory to practice, demonstrating that PCA is an essential tool for **speeding up machine learning models** and **making high-dimensional data interpretable** through visualization.

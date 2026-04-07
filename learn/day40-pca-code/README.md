# PCA: Problem Formulation and Step-by-Step Solution

In this part, we transition from the geometric intuition of PCA to its formal **mathematical problem formulation** and the algorithm used to solve it.



## 1. Problem Formulation

The goal of PCA is to find a new axis (or set of axes) such that when the data is projected onto it, the **variance is maximized**.
### The Mathematical Goal

* Imagine a data point represented as a vector $x$.
* We want to find a **unit vector** $u$ (representing the direction of our new axis).
* The projection of $x$ onto $u$ is given by the dot product $u^T x$.
* **Objective:** Maximize the variance of these projections across all data points, subject to the constraint that $u$ is a unit vector ($||u|| = 1$).


## 2. Step-by-Step Solution (The Algorithm)

To perform PCA manually or understand how libraries like Scikit-Learn do it, follow these steps:

### Step 1: Mean Centering (Standardization)

You must subtract the mean of each feature from the data so that the dataset is centered at the origin $(0,0)$. This is crucial because PCA is sensitive to the variance of the features.

### Step 2: Compute the Covariance Matrix

Calculate how each feature varies with every other feature. If you have $d$ features, you get a $d \times d$ covariance matrix ($\Sigma$).

### Step 3: Calculate Eigenvalues and Eigenvectors

Find the **eigenvectors** and **eigenvalues** of the covariance matrix.

* **Eigenvectors:** These represent the directions of the new axes (Principal Components).
* **Eigenvalues:** These represent the magnitude of variance captured by each corresponding eigenvector.

### Step 4: Sort and Select Components

Sort the eigenvalues in descending order. The eigenvector with the highest eigenvalue is **PC1** (Principal Component 1), the second highest is **PC2**, and so on.

### Step 5: Transform the Data

Multiply your original mean-centered data by the top $k$ eigenvectors to project the data into a lower-dimensional space.



## 3. Practical Example: 3D to 2D

The video demonstrates taking a 3D dataset and projecting it onto a 2D plane. By selecting the two eigenvectors with the largest eigenvalues, we create a 2D "snapshot" of the 3D cloud of data that preserves its maximum spread.
**Key Takeaway:** The "essence" of the data is maintained because we chose the directions where the data points are most distinguished from one another.



## Summary Table

| Step | Action | Why? |
| --- | --- | --- |
| **1** | Mean Centering | Center data at origin. |
| **2** | Covariance Matrix | Capture relationships between features. |
| **3** | Eigen Decomposition | Find directions of maximum variance. |
| **4** | Sort Eigenvalues | Identify the most important components. |
| **5** | Projection | Reduce dimensions to the top $k$ components. |

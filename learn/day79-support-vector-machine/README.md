### 1. The Core Objective: The Best Hyperplane
SVM is a supervised learning algorithm primarily used for classification. The fundamental goal is to find a **hyperplane** (a line in 2D or a plane in 3D) that separates different classes of data points.

While many lines could potentially separate two classes, SVM aims to find the **"optimal" hyperplane**—the one that generalizes best to new, unseen data.

### 2. Maximum Margin Intuition
The key concept in SVM is the **Margin**. The margin is the distance between the hyperplane and the nearest data points from either class.
* **Objective:** SVM seeks to find a hyperplane that **maximizes this margin**.
* **Why?** A larger margin provides a "safety buffer." Points near the decision boundary in a small-margin model are more likely to be misclassified if there's even slight noise in new data.


### 3. Support Vectors
The data points that are closest to the hyperplane and "support" or define the position and orientation of the margin are called **Support Vectors**. 
* These points are the most critical part of the dataset. If you move or remove a support vector, the hyperplane will shift.
* Conversely, moving points that are far away from the margin does not affect the model at all.

### 4. Mathematical Setup
SVM defines two "boundary" lines (gutters) parallel to the main hyperplane:
* $w \cdot x + b = 1$
* $w \cdot x + b = -1$
The goal of the algorithm's optimization is to maximize the distance between these two lines while ensuring all training points fall on the correct side of the gutters.

### 5. Key Advantages of SVM 
* **Effective in High Dimensions:** SVM performs well even when the number of features is greater than the number of samples.
* **Memory Efficient:** Only the support vectors need to be stored in memory to make predictions, not the entire dataset.
* **Non-Linear Capabilities:** Using the **Kernel Trick**, SVM can transform non-linearly separable data into a higher-dimensional space where it *is* linearly separable.
* **Versatile:** It can be used for both classification and regression (SVR) tasks.

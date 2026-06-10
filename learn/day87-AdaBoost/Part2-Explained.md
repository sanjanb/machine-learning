## **1. Initial Setup and Sample Dataset**

To understand how AdaBoost works under the hood, the instructor utilizes a small sample binary classification dataset containing:

* **Total Rows ($N$):** $5$ rows
* **Features:** $X_1$ and $X_2$ (Input columns)
* **Target ($y$):** Binary labels represented as $+1$ or $-1$

#### **Step 1: Assign Initial Weights**

At the start of the AdaBoost training process, every instance/row in the dataset is considered equally important. Therefore, we assign an **Initial Sample Weight ($w_i$)** to each row using the formula:

$$w_i = \frac{1}{N}$$

Since $N = 5$, every row receives an initial sample weight of $1/5 = \mathbf{0.20}$. The total sum of all initial weights equals $1.0$.

| Row ID | $X_1$ | $X_2$ | $y$ | Sample Weight ($w_i$) |
| --- | --- | --- | --- | --- |
| 1 | ... | ... | $+1$ | **0.20** |
| 2 | ... | ... | $-1$ | **0.20** |
| 3 | ... | ... | $+1$ | **0.20** |
| 4 | ... | ... | $+1$ | **0.20** |
| 5 | ... | ... | $-1$ | **0.20** |



## **2. Training Stage 1: The First Weak Learner**

We train the first base model—a **Decision Stump** ($Stump_1$) with a maximum depth of 1—using the input features and initial sample weights. The algorithm scans all possible split points across $X_1$ and $X_2$ to select the single boundary that maximizes Information Gain or minimizes Gini Impurity.

Once $Stump_1$ is selected, it evaluates the dataset and outputs its predictions ($\hat{y}$). For this example, let's assume $Stump_1$ misclassifies **Rows 3 and 5**.

### **Step 2: Calculate the Total Error Rate ($\epsilon$)**

The total error ($\epsilon$) of a weak learner is **not** simply a count of wrong answers. Instead, it is calculated as the **sum of the sample weights of the misclassified instances**:

$$\epsilon_t = \sum_{i \in \text{misclassified}} w_i$$

Since Rows 3 and 5 were incorrect, their weights are added together:

$$\epsilon_1 = w_3 + w_5 = 0.20 + 0.20 = \mathbf{0.40}$$

---

## **3. Determining the Model's Voting Power ($\alpha$)**

Once we know the model's error rate ($\epsilon$), we calculate its **Amount of Say ($\alpha$)**—the quantitative voting weight this specific stump will hold in the final ensemble.

### **The Intuition Behind the Selection Log-Function:**

* If a model makes **zero errors** ($\epsilon = 0$), its amount of say ($\alpha$) should approach positive infinity ($\infty$).
* If a model makes **random guesses** ($\epsilon = 0.50$), its amount of say should equal **$0$**, meaning its output is completely ignored.
* If a model is **always wrong** ($\epsilon = 1.0$), its amount of say should approach negative infinity ($-\infty$). This allows AdaBoost to flip its predictions to achieve perfect correctness.

The mathematical function that perfectly fits this behavior is the **Natural Logarithm of the Odds Ratio** multiplied by 0.5:

$$\alpha_t = \frac{1}{2} \ln\left(\frac{1 - \epsilon_t}{\epsilon_t}\right)$$

Plugging in our calculated error rate ($\epsilon_1 = 0.40$):

$$\alpha_1 = \frac{1}{2} \ln\left(\frac{1 - 0.40}{0.40}\right) = \frac{1}{2} \ln\left(\frac{0.60}{0.40}\right) = \frac{1}{2} \ln(1.5) \approx \mathbf{0.2027}$$



## **4. Updating Instance Weights for Stage 2**

To ensure the next decision stump focuses on the instances misclassified in Stage 1, AdaBoost must dynamically modify the sample weights ($w_i$):

* **Increase (boost)** the weights of misclassified rows.
* **Decrease** the weights of correctly classified rows.

### **The Exponential Update Formulas:**

For **Correctly Classified** rows ($\hat{y}_i = y_i$):

$$w_{\text{new}} = w_{\text{old}} \cdot e^{-\alpha_t}$$

For **Misclassified** rows ($\hat{y}_i \neq y_i$):

$$w_{\text{new}} = w_{\text{old}} \cdot e^{\alpha_t}$$

### **Calculating the Raw New Weights:**

* For Correct Rows (1, 2, 4): $0.20 \cdot e^{-0.2027} = 0.20 \cdot 0.8165 \approx \mathbf{0.1633}$
* For Incorrect Rows (3, 5): $0.20 \cdot e^{0.2027} = 0.20 \cdot 1.2247 \approx \mathbf{0.2449}$

### **Step 3: Weight Normalization**

If we sum these raw updated weights ($0.1633 \times 3 + 0.2449 \times 2$), we get **$0.9797$**. To make sure the updated weights form a valid probability distribution that sums to exactly **$1.0$**, every raw weight is divided by the sum total ($0.9797$):

* **Normalized Correct Weight:** $\frac{0.1633}{0.9797} = \mathbf{0.166}$
* **Normalized Incorrect Weight:** $\frac{0.2449}{0.9797} = \mathbf{0.250}$



## **5. Transitioning to Stage 2 via Up-Sampling**

To pass these new weights to the next weak learner, AdaBoost creates a modified training dataset using **Up-Sampling via a Cumulative Weight Range Grid**.

The algorithm maps each row to a bucket range proportional to its normalized weight:

* Row 1 Range: $[0.000, 0.166)$
* Row 2 Range: $[0.166, 0.332)$ (Size 0.166)
* Row 3 Range: $[0.332, 0.582)$ (**Size 0.250 - Misclassified**)
* Row 4 Range: $[0.582, 0.748)$
* Row 5 Range: $[0.748, 1.000)$ (**Size 0.250 - Misclassified**)

The algorithm selects 5 random floats between $0.0$ and $1.0$. The rows corresponding to the buckets where these numbers land are selected for the new training set.

Because misclassified rows (Rows 3 and 5) have significantly wider bucket intervals, **they have a much higher probability of being selected multiple times**. The updated training set will contain duplicated copies of these difficult instances, forcing the next decision stump ($Stump_2$) to shift its boundary line to capture them correctly.

This loop repeats for a user-defined number of iterations ($T$), generating a sequence of weak learners ($h_t$) and their voting weights ($\alpha_t$).


## **6. The Final Ensemble Prediction**

Once training concludes across all stages, the final classification decision for an unseen input vector $x$ is determined by calculating the sign of the weighted vote:

$$H(x) = \text{Sign}\left( \sum_{t=1}^{T} \alpha_t \cdot h_t(x) \right)$$

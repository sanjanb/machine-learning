### 1. The Core Limitation of the Perceptron Trick
The Perceptron Trick only updates its weights when a point is **misclassified**. Once all points are correctly separated by a line, the algorithm stops updating. This results in a "lazy" boundary that often sits too close to one class, leading to poor generalization on new data. 
### 2. A New Strategy: Listen to Every Point [[03:05](http://www.youtube.com/watch?v=ehO0-6i9qD4&t=185)]
To improve the boundary, the algorithm should consider **every** point, not just the misclassified ones:
* **Misclassified points** should **pull** the line toward them to correct the error.
* **Correctly classified points** should **push** the line away from them to increase the margin and safety.

The intensity of this push or pull depends on the **distance** from the line:
* A misclassified point far from the line pulls harder than one close to it.
* A correctly classified point close to the line pushes harder than one already far away.

### 3. Introducing the Sigmoid Function
To implement this "push and pull" logic, the discrete **Step Function** (which only outputs 0 or 1) is replaced with the **Sigmoid Function**. 
**Mathematical Formula:**
$$\sigma(z) = \frac{1}{1 + e^{-z}}$$

**Key Properties:**
* **Continuous Output:** It converts any input ($z$) into a value between 0 and 1.
* **Probabilistic Interpretation:** The output can be treated as the probability ($P$) that a point belongs to a certain class (e.g., $P=0.8$ means an 80% chance of placement).
* **Gradient Creation:** It creates a "gradient" of confidence across the entire data space rather than a sharp binary cut.

### 4. Updating the Model with Sigmoid
Instead of using a binary prediction $\hat{y} \in \{0, 1\}$, we use the sigmoid output (a decimal between 0 and 1). When we plug this into the weight update equation:
$$W_{new} = W_{old} + \eta(y_i - \hat{y}_i)x_i$$
The term $(y_i - \hat{y}_i)$ will **never be exactly zero** for any point, meaning every single point will exert some influence on the line's position.

### 5. Results and Remaining Gaps
While using the Sigmoid function (the "brown line" in the video's code) significantly improves the model over the basic Perceptron (red line), it still doesn't perfectly match the industry-standard Scikit-Learn `LogisticRegression` (black line). This suggests that while the Sigmoid function is the correct **activation**, the **optimization strategy** (the way we measure and minimize error) still needs improvement. This leads to the next topic: **Log Loss**.

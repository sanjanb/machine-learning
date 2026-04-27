### 1. The Multi-Feature Scenario
In a typical classification problem, we have a set of features $X = (x_1, x_2, x_3, \dots, x_n)$ and we want to predict a class $C_k$ (e.g., "Win" or "Lose").
The goal is to calculate the **Posterior Probability**:
$$P(C_k | x_1, x_2, \dots, x_n)$$

### 2. Applying Bayes' Theorem
Using Bayes' Theorem, the expression becomes:
$$P(C_k | X) = \frac{P(X | C_k) \times P(C_k)}{P(X)}$$
* Since the denominator $P(X)$ is constant for all classes, we can ignore it when comparing probabilities to find the most likely class.


### 3. The Chain Rule of Probability
The likelihood term $P(X | C_k)$ is actually a joint probability of all features:
$$P(x_1, x_2, \dots, x_n | C_k)$$
By the **Chain Rule**, this can be broken down into a complex series of conditional probabilities:
$$P(x_1|C_k) \times P(x_2|x_1, C_k) \times P(x_3|x_1, x_2, C_k) \dots$$
This is extremely difficult to compute because as you add more features, the data points matching those exact combinations become very rare.

### 4. The Naive Assumption: Conditional Independence 
To simplify, the algorithm makes the **"Naive" assumption** that each feature $x_i$ is **conditionally independent** of every other feature $x_j$ given the class $C_k$.
This means:
$$P(x_i | x_j, C_k) = P(x_i | C_k)$$

### 5. The Generalized Model 
Under the independence assumption, the complex joint probability simplifies into a simple product of individual likelihoods:
$$P(X | C_k) = P(x_1 | C_k) \times P(x_2 | C_k) \times \dots \times P(x_n | C_k)$$
Mathematically, this is written using the product symbol ($\prod$):
$$P(C_k | X) \propto P(C_k) \prod_{i=1}^{n} P(x_i | C_k)$$ 

### 6. Final Classification (MAP Rule) 
The classifier picks the class $C_k$ that maximizes this product. This is known as the **Maximum A Posteriori (MAP)** decision rule:
$$\hat{y} = \text{argmax}_{k} \left( P(C_k) \prod_{i=1}^{n} P(x_i | C_k) \right)$$ 

This simple multiplication makes the algorithm incredibly efficient and scalable for high-dimensional data like text.

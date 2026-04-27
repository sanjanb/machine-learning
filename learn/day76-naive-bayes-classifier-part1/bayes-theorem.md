### 1. The Formul
Bayes' Theorem is expressed as:
$$P(A|B) = \frac{P(B|A) \times P(A)}{P(B)}$$

Where:
* **$P(A|B)$ (Posterior Probability)**: The probability of hypothesis A given evidence B.
* **$P(B|A)$ (Likelihood)**: The probability of evidence B given that hypothesis A is true.
* **$P(A)$ (Prior Probability)**: The initial probability of hypothesis A before considering evidence B.
* **$P(B)$ (Evidence/Marginal Likelihood)**: The total probability of evidence B under all possible hypotheses.


### 2. Derivation of the Theorem
The theorem is derived directly from the definition of conditional probability:
1.  From conditional probability: $P(A \cap B) = P(A|B) \times P(B)$
2.  Also: $P(B \cap A) = P(B|A) \times P(A)$
3.  Since $P(A \cap B) = P(B \cap A)$, we can set the equations equal to each other:
    $$P(A|B) \times P(B) = P(B|A) \times P(A)$$
4.  Solving for $P(A|B)$ gives the final Bayes' Theorem formula.


### 3. Why is it useful?
Bayes' Theorem allows us to "flip" conditional probabilities. In machine learning, we often want to find the probability of a **Class** given some **Features** ($P(Class|Features)$). However, it is usually easier to calculate the probability of the **Features** given a **Class** ($P(Features|Class)$) from our training data. Bayes' Theorem provides the bridge to solve this problem [[04:21](http://www.youtube.com/watch?v=Oqw-v-Z7PuU&t=261)].

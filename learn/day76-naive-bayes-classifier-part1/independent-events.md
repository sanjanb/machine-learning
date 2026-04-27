### 1. What are Independent Events?
Two events, A and B, are considered **independent** if the occurrence of one event does not affect the probability of the other occurring.
* **Example**: Tossing a coin and rolling a die. Getting a "Head" on the coin has zero impact on whether you roll a "6" on the die.

### 2. Mathematical Definition
Mathematically, two events A and B are independent if and only if:
$$P(A \cap B) = P(A) \times P(B)$$
This means the probability of both events happening together is simply the product of their individual probabilities.


### 3. Relation to Conditional Probability
As discussed in Part 1, the formula for conditional probability is $P(A|B) = \frac{P(A \cap B)}{P(B)}$. 
If events A and B are **independent**, then:
1.  Substitute $P(A \cap B)$ with $P(A) \times P(B)$.
2.  The formula becomes: $P(A|B) = \frac{P(A) \times P(B)}{P(B)}$
3.  **Result**: $P(A|B) = P(A)$.

**Insight**: If A and B are independent, the probability of A given B is just the probability of A. Knowing that B happened gives you **no new information** about A.

### 4. Why "Naive" Bayes?
The Naive Bayes algorithm is called "naive" because it makes the strong (and often unrealistic) assumption that all input features are **independent** of each other given the class label. 
* *Example*: In email spam detection, it assumes the presence of the word "Free" is independent of the word "Money," even though they often appear together.

Despite this simplified assumption, the algorithm performs remarkably well for many real-world tasks like text classification and sentiment analysis.

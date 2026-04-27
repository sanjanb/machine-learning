### 1. What are Mutually Exclusive Events?
Two events, A and B, are mutually exclusive if they **cannot happen at the same time**. In other words, the occurrence of one event excludes the possibility of the other.

Mathematically, the probability of their intersection is zero:
$$P(A \cap B) = 0$$


**Common Examples:**
* **Coin Toss**: You can get a "Head" or a "Tail," but you cannot get both on a single toss.
* **Rolling a Die**: You can roll a "3" or a "5," but you cannot roll both simultaneously in one roll.

### 2. Relation to Conditional Probability
If you know that events A and B are mutually exclusive, then the conditional probability $P(A|B)$ is always **zero**.
$$P(A|B) = \frac{P(A \cap B)}{P(B)} = \frac{0}{P(B)} = 0$$
**Insight**: If event B has happened, the probability of A happening is zero because they cannot coexist.

### 3. Mutually Exclusive vs. Independent
It is a common mistake to confuse these two terms, but they are very different:
* **Independent Events**: One event happening tells you *nothing* about the other ($P(A|B) = P(A)$).
* **Mutually Exclusive Events**: One event happening tells you *for certain* that the other did not happen ($P(A|B) = 0$).


Understanding these differences is key to correctly applying the probability rules used in the Naive Bayes algorithm.

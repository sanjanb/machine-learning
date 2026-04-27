### 1. What is Conditional Probability?
Conditional probability is the likelihood of an event occurring, **given** that another event has already occurred. It is denoted as $P(A|B)$, which reads as "the probability of event A given event B."

The mathematical formula is:
$$P(A|B) = \frac{P(A \cap B)}{P(B)}$$
* **$P(A \cap B)$**: The probability that both event A and event B happen together (Intersection).
* **$P(B)$**: The probability of the "given" event (the condition).


### 2. Practical Example: Rolling Two Dice
To explain the concept, the video uses the example of rolling two dice ($D1$ and $D2$).
* **Total Sample Space**: $6 \times 6 = 36$ possible outcomes (ranging from $(1,1)$ to $(6,6)$).
* **Event A**: The sum of the two dice is $\le 5$.
* **Event B**: The first die ($D1$) shows a $3$.

#### Calculating $P(A|B)$:
1.  **Identify $P(B)$**: The outcomes where $D1=3$ are $(3,1), (3,2), (3,3), (3,4), (3,5), (3,6)$. There are **6** such outcomes. So, $P(B) = 6/36$.
2.  **Identify $P(A \cap B)$**: Out of the outcomes where $D1=3$, which ones have a sum $\le 5$?
    * $(3,1)$ (Sum = 4)
    * $(3,2)$ (Sum = 5)
    * There are **2** such outcomes. So, $P(A \cap B) = 2/36$.
3.  **Apply Formula**:
    $$P(A|B) = \frac{2/36}{6/36} = \frac{2}{6} = \frac{1}{3} \approx 0.33$$

### 3. Why is this Important?
In machine learning, especially with Naive Bayes, we often want to find the probability of a "Class" given a set of "Features." For example:
* $P(\text{Spam} | \text{"Free", "Winner", "Click"})$
* $P(\text{Placement} | \text{CGPA=9.0, IQ=120})$

By understanding the conditional probability of labels based on input data, we can build effective classification models.

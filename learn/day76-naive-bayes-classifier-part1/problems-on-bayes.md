### The Problem Scenario
A factory has three machines ($M_1, M_2, M_3$) producing markers.
* **Production Share:**
    * $M_1$ produces **20%** of total markers ($P(M_1) = 0.20$).
    * $M_2$ produces **30%** of total markers ($P(M_2) = 0.30$).
    * $M_3$ produces **50%** of total markers ($P(M_3) = 0.50$).
* **Defect Rates:**
    * $5\%$ of markers from $M_1$ are defective ($P(D|M_1) = 0.05$).
    * $3\%$ of markers from $M_2$ are defective ($P(D|M_2) = 0.03$).
    * $1\%$ of markers from $M_3$ are defective ($P(D|M_3) = 0.01$).

**The Question:** If a marker is picked at random and found to be **defective (D)**, what is the probability that it was produced by **Machine 3 ($M_3$)**?

### 1. Identify the Goal
We need to find the posterior probability: **$P(M_3|D)$**.

### 2. Apply Bayes' Theorem
According to the formula:
$$P(M_3|D) = \frac{P(D|M_3) \times P(M_3)}{P(D)}$$


### 3. Calculate the Components
* **Numerator:** $P(D|M_3) \times P(M_3) = 0.01 \times 0.50 = \mathbf{0.005}$.
* **Denominator ($P(D)$ - Total Probability of Defect):**
  To find the total probability of picking a defective marker, we sum the probabilities of getting a defect from each machine:
  $$P(D) = [P(D|M_1) \times P(M_1)] + [P(D|M_2) \times P(M_2)] + [P(D|M_3) \times P(M_3)]$$
  $$P(D) = (0.05 \times 0.20) + (0.03 \times 0.30) + (0.01 \times 0.50)$$
  $$P(D) = 0.010 + 0.009 + 0.005 = \mathbf{0.024}$$

### 4. Final Calculation 
$$P(M_3|D) = \frac{0.005}{0.024} = \frac{5}{24} \approx \mathbf{0.208}$$

**Conclusion:** There is approximately a **20.8%** chance that the defective marker came from Machine 3, despite Machine 3 being the largest producer, because its defect rate is significantly lower than the others.

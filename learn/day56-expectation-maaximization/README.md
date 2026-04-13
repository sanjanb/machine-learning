### 1. What is the EM Algorithm?
The EM algorithm is used when direct Maximum Likelihood Estimation is difficult because some data is unobserved. For example, in a spreadsheet, you might have all the rows (individuals) but be missing an entire column (a specific variable like a category label).

### 2. The Two Primary Steps
The algorithm alternates between two main phases until it reaches a stable solution (convergence):
* **Expectation Step (E-step):** You "guess" the missing data by calculating the expected value of the latent variables based on your current parameter estimates. This step accounts for uncertainty by using probabilities rather than making a single hard choice.
* **Maximization Step (M-step):** You update your parameters (e.g., means or probabilities) to maximize the "expected likelihood" found in the E-step.

### 3. Practical Example: The Two-Coin Problem
Suppose you have two biased coins (A and B) but don't know which coin was used for a set of flip sequences.
* **Initial Guess:** Start with random probabilities for Coin A and Coin B.
* **E-step:** Calculate the probability that each sequence came from Coin A or Coin B. Instead of saying "This *is* Coin A," you might say "This is 70% likely to be Coin A and 30% likely to be Coin B".
* **M-step:** Use these "weighted" counts to calculate new, better estimates for the bias of each coin.
* **Repeat:** Use the new biases to re-calculate probabilities, and continue until the values stop changing.

### 4. Why Does It Work? (The Math)
The EM algorithm works by maximizing a **surrogate function** (called the **Q-function**) that serves as a lower bound for the actual log-likelihood.
* **Jensen's Inequality:** This mathematical tool is used to move the logarithm inside the expectation, creating a lower bound that is easier to maximize than the original likelihood function.
* **Convergence:** Every step of the EM algorithm is guaranteed to either increase the likelihood or keep it the same—it never makes it worse.


### 5. Common Applications
* **Gaussian Mixture Models (GMMs):** Finding the centers and spreads of multiple overlapping "bell curves" when you don't know which data point belongs to which curve.
* **Clustering:** Used in "soft" clustering where points can belong to multiple clusters with varying degrees of probability.
* **Hidden Markov Models (HMMs):** Estimating state transitions in sequences where the states themselves are not visible.

### 6. Important Considerations
* **Local Optima:** The algorithm can get stuck in a "local maximum" (a peak that isn't the highest one). To fix this, it's common to run the algorithm multiple times with different starting guesses.
* **Missing Labels:** Its greatest strength is handling "missing labels" in datasets, effectively performing unsupervised learning.

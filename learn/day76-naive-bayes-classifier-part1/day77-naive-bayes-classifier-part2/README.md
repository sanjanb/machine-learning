### 1. The Core Objective
The goal of the classifier is to predict a **Class** (the outcome) based on several **Features** (input conditions). 
* **Example:** Predicting if a cricket team (Chennai) will **Win** or **Lose**.
* **Features:**
    1.  **Toss**: Won or Lost.
    2.  **Venue**: Mumbai, Chennai, etc.
    3.  **Weather**: Sunny, Overcast, etc.

### 2. Applying Bayes' Theorem for Classification
To make a prediction, we calculate the probability for every possible class given the specific features we are observing.
* $P(\text{Win} | \text{Toss=Loss, Venue=Mumbai, Weather=Sunny})$
* $P(\text{Lose} | \text{Toss=Loss, Venue=Mumbai, Weather=Sunny})$

We then compare these probabilities. Whichever is higher becomes the predicted outcome.

### 3. The "Naive" Simplification
Calculating the probability of all features happening *together* ($P(\text{Loss} \cap \text{Mumbai} \cap \text{Sunny})$) is difficult because you might not have that specific combination in your training data.

To solve this, Naive Bayes assumes the features are **independent**. This allows us to break the complex probability into a simple product of individual probabilities:
$$P(\text{Loss, Mumbai, Sunny} | \text{Win}) = P(\text{Loss} | \text{Win}) \times P(\text{Mumbai} | \text{Win}) \times P(\text{Sunny} | \text{Win})$$


### 4. Step-by-Step Prediction
1.  **Prior Probabilities**: Calculate how often the team wins and loses overall ($P(\text{Win})$ and $P(\text{Lose})$).
2.  **Likelihoods**: Calculate the probability of each individual feature occurring given each outcome (e.g., how often do they win when it's sunny?).
3.  **Product**: Multiply the Prior by all the Likelihoods for each class.
4.  **Compare**: The class with the higher resulting value is the prediction. Note that we ignore the denominator ($P(\text{Evidence})$) because it is the same for both calculations and doesn't change which one is higher.

This approach turns a complex multi-dimensional problem into a simple counting and multiplication task, making it incredibly fast and efficient.

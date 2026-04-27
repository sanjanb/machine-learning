This video explains how the **Naive Bayes Classifier** handles **Numerical/Continuous data**, moving beyond the categorical examples discussed in previous parts of the series.

### **1. The Problem with Numerical Data**
In categorical Naive Bayes, we calculate probabilities by counting frequencies (e.g., how many times "Sunny" occurs when the outcome is "Yes"). However, with numerical data like **Height** or **Weight**, a specific value (e.g., 175.5 cm) might not exist in the training set at all. If we used frequency counting, the probability would be **zero**, breaking the entire model [[03:04](http://www.youtube.com/watch?v=TCgK2nBJx9o&t=184)].

### **2. The Solution: Gaussian Naive Bayes**
To solve this, we assume that the numerical features follow a specific probability distribution—most commonly the **Normal (Gaussian) Distribution**.

* **The Assumption:** For each class (e.g., Male vs. Female), the distribution of a feature (like Height) follows a "Bell Curve."
* **Parameters Needed:** We only need to calculate two statistics from the training data for each class:
    1.  **Mean ($\mu$):** The average value.
    2.  **Standard Deviation ($\sigma$):** The spread of the values.

### **3. Calculating Probability**
Instead of counting frequencies, we use the **Probability Density Function (PDF)** of the Normal Distribution to find the likelihood of a specific value ($x$):

$$P(x_i | y) = \frac{1}{\sqrt{2\pi\sigma_y^2}} e^{-\frac{(x_i - \mu_y)^2}{2\sigma_y^2}}$$

* You plug your new data point ($x$) into this formula along with the mean and standard deviation calculated during training.
* The resulting value acts as the "probability" for that numerical feature, which is then multiplied by the other feature probabilities and the prior probability ($P(y)$) to get the final score.

### **4. Other Distributions**
While **Gaussian Naive Bayes** is the most common for numerical data, the video notes that you can use other distributions if the data doesn't look "bell-shaped":
* **Multinomial:** Often used for discrete counts (like word counts in text).
* **Bernoulli:** Used for binary/boolean features.

### 1. What is Bias?
**Bias** refers to the error introduced by approximating a real-world problem with a simplified model.
* **High Bias:** The model is too simple and cannot capture the underlying patterns in the training data (e.g., using a straight line for data that follows a curve). This leads to **Underfitting**.
* **Performance:** A high-bias model performs poorly on both training and test data.


### 2. What is Variance?
**Variance** refers to the model's sensitivity to small fluctuations in the training data.
* **High Variance:** The model is too complex and "memorizes" the training data, including the noise (e.g., a high-degree polynomial that passes through every point). This leads to **Overfitting**.
* **Performance:** A high-variance model performs exceptionally well on training data but fails to generalize to new, unseen test data.


### 3. Underfitting vs. Overfitting
The video uses an analogy of a student preparing for an exam.
* **Underfitting:** A student who didn't study at all. They perform poorly on practice tests and the final exam.
* **Overfitting:** A student who memorized the exact questions from the textbook. They get 100% on practice tests but fail the final exam because the questions are slightly different.
* **Ideal Model:** A student who understands the core concepts. They perform consistently well on both practice and final exams.

### 4. The Trade-off
The goal of machine learning is to find the "sweet spot" where both bias and variance are low.
* As you increase **model complexity**, Bias decreases (the model fits the training data better), but Variance increases (the model becomes too sensitive to noise).
* The total error is a combination of Bias and Variance. We aim for the point where the **Total Error** is minimized.
### 5. The Bullseye Diagram
A common way to visualize this is the "Bullseye" target.
* **Low Bias, Low Variance:** Hits the center consistently (The Goal).
* **Low Bias, High Variance:** Hits around the center but is spread out.
* **High Bias, Low Variance:** Consistently hits the wrong spot (far from center).
* **High Bias, High Variance:** Scattered and far from the center (The Worst Case).


### Summary
* **Simple Models** (Linear) $\rightarrow$ High Bias, Low Variance $\rightarrow$ Underfitting.
* **Complex Models** (High-degree Polynomials) $\rightarrow$ Low Bias, High Variance $\rightarrow$ Overfitting.
* **Techniques like Regularization** (which you will learn later) are used to strike the perfect balance between the two.

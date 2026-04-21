### 1. Accuracy Score
Accuracy is the simplest classification metric. It is the ratio of correct predictions to the total number of predictions.
$$\text{Accuracy} = \frac{\text{Number of Correct Predictions}}{\text{Total Predictions}}$$

* **Binary Classification:** Works the same way—comparing predicted labels (0 or 1) against actual labels.
* **Multi-class Classification:** The logic remains identical even with 3 or more classes (e.g., Iris dataset).

### 2. Limitations of Accuracy
Accuracy is not always a reliable metric:
* **Context Dependency:** In medical diagnostics or self-driving cars, 99% accuracy might be unacceptably low because a single error could be fatal.
* **Nature of Error:** Accuracy doesn't tell you *what kind* of mistake the model is making (e.g., did it fail to catch a sick person, or did it wrongly flag a healthy person as sick?).
* **Imbalanced Data:** In datasets where one class is very rare (e.g., credit card fraud or airport security screening), a model that simply predicts "No Fraud" for everyone will have extremely high accuracy but fail its core purpose.

### 3. The Confusion Matrix
A Confusion Matrix provides a detailed breakdown of correct and incorrect predictions by category.

| | **Predicted: 1** | **Predicted: 0** |
|---|---|---|
| **Actual: 1** | **True Positive (TP)** | **False Negative (FN)** |
| **Actual: 0** | **False Positive (FP)** | **True Negative (TN)** |


**Key Terminology:**
* **True Positive (TP):** Predicted 1, Actual 1 (Correct).
* **True Negative (TN):** Predicted 0, Actual 0 (Correct).
* **False Positive (FP):** Predicted 1, Actual 0 (**Type 1 Error**).
* **False Negative (FN):** Predicted 0, Actual 1 (**Type 2 Error**).

### 4. Multi-class Confusion Matrix
For more than two classes, the matrix grows (e.g., $3 \times 3$ for Iris, $10 \times 10$ for MNIST digit recognition). Diagonal elements represent correct predictions, while off-diagonal elements show exactly which classes are being confused with each other.


### 5. Type 1 vs. Type 2 Errors
* **Type 1 (False Positive):** Telling someone they have a disease when they don't.
* **Type 2 (False Negative):** Telling someone they are healthy when they actually have a disease. In medical contexts, Type 2 is usually far more dangerous.


http://googleusercontent.com/youtube_content/27

### 1. Precision
Precision measures the quality of positive predictions. It answers: *"Of all instances the model predicted as positive, how many were actually positive?"*

* **Formula:** $\frac{TP}{TP + FP}$
* **When to use:** Use Precision when **False Positives** are more dangerous (Type 1 Error).
* **Example:** In a Spam Filter, you don't want a legitimate email (like a job offer) to be wrongly marked as spam.


### 2. Recall (Sensitivity)
Recall measures the model's ability to find all positive instances. It answers: *"Of all the actual positive instances, how many did the model identify?"*

* **Formula:** $\frac{TP}{TP + FN}$
* **When to use:** Use Recall when **False Negatives** are more dangerous (Type 2 Error).
* **Example:** In Cancer Detection, it is critical not to miss a sick patient, even if it means some healthy people get extra tests.

### 3. F1 Score 
The F1 Score is the **harmonic mean** of Precision and Recall. It provides a single metric that balances both.

* **Formula:** $2 \times \frac{\text{Precision} \times \text{Recall}}{\text{Precision} + \text{Recall}}$
* **Why Harmonic Mean?** Unlike a simple average, the harmonic mean penalizes extreme values. If either Precision or Recall is very low, the F1 Score will be low.


### 4. Multi-class Classification
In scenarios with more than two classes (e.g., classifying images as Cat, Dog, or Rabbit), these metrics are calculated differently:

* **Per-class calculation:** Calculate Precision, Recall, and F1 for each class individually.
* **Macro Average:** The simple average of all per-class metrics. Treat all classes as equally important.
* **Weighted Average:** The average weighted by the number of instances in each class (support). This is better for imbalanced datasets.

### 5. Implementation in Scikit-Learn
You can use `classification_report` to get a comprehensive summary of all these metrics at once:

```python
from sklearn.metrics import classification_report
print(classification_report(y_test, y_pred))
```

This report includes Precision, Recall, F1-Score, and Support for every class, along with macro and weighted averages.

## 1. Hard Voting vs. Soft Voting (Core Distinction)

When configuring a Voting Classifier in `scikit-learn`, the `voting` hyperparameter accepts two strategies: `'hard'` (default) or `'soft'`.

### Hard Voting (Majority Class Labels)

In Hard Voting, every base model predicts a discrete class label for a query point. The ensemble counts these predictions as "votes" and selects the class that receives the absolute majority.

* **Example:** If you have a binary classification task ($0$ or $1$):
* Model 1 ($M_1$) predicts `Class 0`
* Model 2 ($M_2$) predicts `Class 0`
* Model 3 ($M_3$) predicts `Class 1`
* **Final Ensemble Prediction:** `Class 0` (via a 2:1 vote)



### Soft Voting (Average Predicted Probabilities)

In Soft Voting, instead of looking at the final class labels, the ensemble collects the raw **predicted class probabilities** from each base model. It calculates the **average probability** for each individual class across all models and selects the class with the highest average probability.

* **Example Matrix Calculation:**

| Model | Class 0 Probability | Class 1 Probability | Hard Vote Output |
| --- | --- | --- | --- |
| Model 1 ($M_1$) | 0.60 | 0.40 | Class 0 |
| Model 2 ($M_2$) | 0.80 | 0.20 | Class 0 |
| Model 3 ($M_3$) | 0.10 | 0.90 | Class 1 |
| **Average** | **0.50** ($\frac{0.6+0.8+0.1}{3}$) | **0.50** ($\frac{0.4+0.2+0.9}{3}$) | — |

* **Note on Performance:** Soft Voting often outperforms Hard Voting because it accounts for a model's *certainty* rather than just its final discrete choice. However, every underlying base model must support probability calibration (i.e., have a `predict_proba()` method).



## 2. Practical Implementations in Scikit-Learn 

The presenter showcases two distinct structural patterns to design a Voting Classifier using the Iris dataset (specifically isolating overlapping regions between *versicolor* and *virginica* to make classification challenging).

### Pattern A: Heterogeneous Ensembling (Different Algorithms)

This approach combines entirely different algorithms to maximize model diversity.

```python
from sklearn.linear_model import LogisticRegression
from sklearn.neighbors import KNeighborsClassifier
from sklearn.ensemble import RandomForestClassifier, VotingClassifier
from sklearn.model_selection import cross_val_score
import numpy as np

# 1. Instantiate individual structural base models
clf1 = LogisticRegression()
clf2 = KNeighborsClassifier()
clf3 = RandomForestClassifier()

# 2. Structure estimators as a list of name-estimator tuples
estimators = [('lr', clf1), ('knn', clf2), ('rf', clf3)]

# 3. Build Hard Voting Classifier
vc_hard = VotingClassifier(estimators=estimators, voting='hard')
scores_hard = cross_val_score(vc_hard, X, y, cv=10, scoring='accuracy')
print("Hard Voting Accuracy:", np.mean(scores_hard)) [00:17:14]

# 4. Build Soft Voting Classifier
vc_soft = VotingClassifier(estimators=estimators, voting='soft')
scores_soft = cross_val_score(vc_soft, X, y, cv=10, scoring='accuracy')
print("Soft Voting Accuracy:", np.mean(scores_soft)) [00:17:49]

```

### Pattern B: Homogeneous Ensembling (Same Algorithm, Different Hyperparameters)

Instead of mixing algorithms, you can train multiple instances of the *same* algorithm using different hyperparameter constraints (e.g., varying polynomial degrees in an SVM) and group them inside a Voting Classifier to build a stabilized meta-model.

```python
from sklearn.svm import SVC

# Create a collection of SVMs with varying polynomial degrees
estimators = []
for i in range(1, 6):
    estimators.append((f'svm_deg_{i}', SVC(kernel='poly', degree=i, probability=True))) [00:21:27]

# Ensemble them using Soft Voting
vc_poly_ensemble = VotingClassifier(estimators=estimators, voting='soft')
scores = cross_val_score(vc_poly_ensemble, X, y, cv=10, scoring='accuracy')
print("Hyperparameter Ensemble Accuracy:", np.mean(scores)) [00:22:35]

```

---

## 3. Tuning the `weights` Hyperparameter

By default, every classifier in a democracy gets an equal vote ($1:1:1$). However, if one specific base model performs noticeably better than the others, you can pass an array of integers/floats to the `weights` parameter to skew structural importance:

```python
# Giving more authority to the first estimator ('lr') because it performs best
vc_weighted = VotingClassifier(estimators=estimators, voting='soft', weights=[3, 1, 1]) [00:19:55]

```

The presenter demonstrates that by iteratively grid-searching over various integer weights loops (`weights=[i, j, k]`), you can dynamically shift the underlying decision boundary to find an optimal configuration that yields higher test accuracy [[18:42](http://www.youtube.com/watch?v=pGQnNYdPTvY&t=1122), [20:11](http://www.youtube.com/watch?v=pGQnNYdPTvY&t=1211)].

[Voting Ensemble | Classification | Voting Classifier | Hard Voting Vs Soft Voting | Part 2](https://youtu.be/pGQnNYdPTvY?si=YnZk6XZn5PcVFTlM)

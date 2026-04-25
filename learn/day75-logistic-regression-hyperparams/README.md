Logistic Regression in Scikit-Learn offers several hyperparameters that allow you to control its performance, regularization, and behavior. Understanding these is crucial for fine-tuning your model.

### 1. Penalty (Regularization Type)
Regularization prevents overfitting by penalizing large weights.
* **'l1'**: Lasso regularization. Can lead to sparse features (some weights become zero).
* **'l2'**: Ridge regularization (Default). Penalizes the square of the weights.
* **'elasticnet'**: A combination of L1 and L2.
* **'none'**: No regularization applied.


### 2. C (Inverse Regularization Strength)
* $C = 1 / \lambda$.
* **Small C:** Strong regularization (simpler model, higher bias, lower variance).
* **Large C:** Weak regularization (complex model, lower bias, potentially higher variance).

### 3. Solver (Optimization Algorithm)
The solver is the algorithm used to find the optimal weights. Different solvers support different penalties:
* **'lbfgs'**: Default. Good for small to medium datasets. Supports L2 or no penalty.
* **'liblinear'**: Good for small datasets. Supports L1 and L2.
* **'sag'** & **'saga'**: Faster for very large datasets. 'saga' is the only one supporting all penalty types including Elastic Net.
* **'newton-cg'**: Supports L2 or no penalty.

### 4. Multi_class
* **'ovr' (One-vs-Rest)**: Trains a binary classifier for each class against all others.
* **'multinomial'**: Uses Softmax regression for multi-class problems.
* **'auto'**: Automatically chooses between 'ovr' and 'multinomial' based on the data and solver.

### 5. Other Notable Parameters
* **max_iter**: Maximum number of iterations for the solver to converge (Default: 100). If the model doesn't converge, increase this.
* **class_weight**: Set to `'balanced'` for imbalanced datasets to automatically adjust weights based on class frequencies.
* **l1_ratio**: Only used when `penalty='elasticnet'`. Defines the mix between L1 and L2.
* **n_jobs**: Number of CPU cores to use for parallel processing (set to -1 to use all cores).

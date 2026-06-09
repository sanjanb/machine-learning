### **Overview**

The Random Forest algorithm is highly flexible and contains a large suite of hyperparameters. To simplify optimization, the instructor divides these hyperparameters into three distinct categories:

1. **Random Forest-Specific Parameters:** Control the overarching ensemble layer.
2. **Decision Tree-Specific Parameters:** Control the architectural growth of the individual trees inside the forest.
3. **General Parameters:** Structural options common to most Scikit-Learn estimators.

The parameters discussed apply symmetrically to both `RandomForestClassifier` and `RandomForestRegressor`, with minor adjustments to the splitting criterion (e.g., Gini/Entropy vs. MSE/MAE).


### **Category 1: Random Forest-Specific Parameters**

These parameters configure the macro-ensemble structure, directly manipulating the aggregation and sampling behaviors.

#### **1. `n_estimators`**

* **Definition:** The total number of individual decision trees to build in the forest.
* **Default Value:** 100.
* **Impact:** Increasing `n_estimators` creates smoother, more stable decision boundaries and effectively protects against overfitting. However, it comes at a linear computational cost—doubling the trees doubles the training time.

#### **2. `max_samples`**

* **Definition:** The maximum number of rows from the original dataset provided to train any single decision tree.
* **Impact:** Manipulating this alters the intensity of row-level bootstrap sampling.
* Dropping this value down to extreme lows (e.g., 5 or 10 rows) starves the trees of information and degrades accuracy.
* **Rule of Thumb:** Setting `max_samples` between **50% to 75% (0.50 to 0.75)** of the dataset size yields the most mathematically optimum, de-correlated results.

#### **3. `max_features`**

* **Definition:** The maximum number of columns/features randomly sampled at each node split.
* **Options:**
  * `int` / `float`: A fixed count or percentage of total columns.
  * `"sqrt"` or `"auto"`: Takes $\sqrt{\text{total features}}$. For example, if you have 100 features, each split samples 10 features randomly.
  * `"log2"`: Takes $\log_2(\text{total features})$.
  * `None`: Uses all features (disables dynamic node-level feature sampling).

#### **4. `bootstrap`**

* **Definition:** A boolean value dictating whether row sampling is conducted *with replacement* (True) or *without replacement* (False).
* **Default Value:** `True`.



### **Category 2: Underlying Decision Tree Parameters**

These parameters are inherited directly from Scikit-Learn's `DecisionTreeClassifier` and dictate how deep or specialized individual trees grow.

* **`criterion`:** Decides how split quality is evaluated. Classifiers use `"gini"` or `"entropy"`, while regressors rely on error metrics like `"mse"` (Mean Squared Error) or `"mae"` (Mean Absolute Error).
* **`max_depth`:** Restricts how deep an individual tree can grow. Leaving it at `None` allows trees to grow completely until they achieve pure leaves, maintaining low bias.
* **`min_samples_split`:** The minimum number of samples a node must contain before it is allowed to split into child nodes.
* **`min_samples_leaf`:** The minimum number of data samples required to be present within a terminal leaf node.
* **`max_leaf_nodes`:** Sets a hard limit on the total number of leaf nodes an individual tree can generate.



### **Category 3: General Utility Parameters**

These options control performance, determinism, and data formatting rather than mathematical learning.

* **`n_jobs`:** Tells Scikit-Learn how many processor cores to utilize. Setting `n_jobs=-1` forces the model to leverage all available CPU cores to train multiple decision trees completely in parallel, massively reducing runtime.
* **`random_state`:** Fixes a numerical seed to ensure the random row/feature selections are perfectly reproducible across multiple script runs.
* **`class_weight`:** Highly useful for handling **imbalanced datasets**. It assigns custom weights or penalties to specific classes to ensure minority classes are not systematically ignored.
* **`verbose`:** Outputs tracking readouts and diagnostic logging statements directly to the console during training execution.
* **`warm_start`:** When set to `True`, it allows you to reuse an existing trained forest, add more trees (`n_estimators`) to it, and continue training without resetting the entire model.

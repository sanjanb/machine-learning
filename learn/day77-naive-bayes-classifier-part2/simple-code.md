### **1. The Dataset Overview**
The dataset consists of 14 observations with four weather-related features and one target variable:
* **Features:** Outlook (Sunny, Overcast, Rain), Temperature (Hot, Mild, Cool), Humidity (High, Normal), and Wind (Weak, Strong).
* **Target:** Play Tennis (Yes or No).

### **2. The Workflow: Training vs. Testing**
The instructor breaks the process into two distinct stages:
* **Stage 1: Training (Building the Lookup Table):** The algorithm scans the entire dataset to calculate all possible conditional probabilities (e.g., $P(\text{Sunny}|\text{Yes})$, $P(\text{Hot}|\text{No})$). These are stored in a dictionary or lookup table for quick access.
* **Stage 2: Testing (Prediction):** When a new weather condition is provided, the model simply fetches the required probabilities from its lookup table and performs a multiplication.

### **3. Manual Probability Calculation**
The video demonstrates how to calculate these values using `pandas` and `crosstab`. 
* **Prior Probabilities:** * $P(\text{Yes}) = 9/14$
    * $P(\text{No}) = 5/14$
* **Conditional Probabilities (Examples):**
    * $P(\text{Overcast}|\text{Yes}) = 4/9$
    * $P(\text{Sunny}|\text{No}) = 3/5$

### **4. Making a Prediction**
To predict if a game will be played on a day where the conditions are **Sunny, Hot, High Humidity, and Weak Wind**, the "Maximum A Posteriori" (MAP) rule is applied:

1.  **Calculate Score for "Yes":** $P(\text{Yes}) \times P(\text{Sunny}|\text{Yes}) \times P(\text{Hot}|\text{Yes}) \times P(\text{High}|\text{Yes}) \times P(\text{Weak}|\text{Yes}) \approx \mathbf{0.007}$
2.  **Calculate Score for "No":** $P(\text{No}) \times P(\text{Sunny}|\text{No}) \times P(\text{Hot}|\text{No}) \times P(\text{High}|\text{No}) \times P(\text{Weak}|\text{No}) \approx \mathbf{0.02}$

**Conclusion:** Since the probability score for "No" ($0.02$) is higher than "Yes" ($0.007$), the model concludes that the tennis match will **not** be played.

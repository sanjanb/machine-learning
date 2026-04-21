### 1. The Sigmoid Function
The Sigmoid function, denoted as $\sigma(x)$, is defined as:
$$\sigma(x) = \frac{1}{1 + e^{-x}}$$

### 2. The Derivation Process
To find the derivative $\frac{d}{dx}\sigma(x)$, the video applies the following calculus rules:
* **Reciprocal Rule:** $\frac{d}{dx}(\frac{1}{u}) = -\frac{1}{u^2} \frac{du}{dx}$.
* **Chain Rule:** Used to handle the $e^{-x}$ term inside the denominator.

**Steps:**
1.  Rewrite the function as $(1 + e^{-x})^{-1}$.
2.  Differentiate to get $-(1 + e^{-x})^{-2} \cdot \frac{d}{dx}(1 + e^{-x})$.
3.  Simplify the internal derivative: $\frac{d}{dx}(1 + e^{-x}) = -e^{-x}$.
4.  The negatives cancel out, leaving: $\frac{e^{-x}}{(1 + e^{-x})^2}$.

### 3. The Final Simplified Result
Through clever algebraic manipulation (adding and subtracting 1 in the numerator), the derivative can be expressed in terms of the original Sigmoid function itself:
$$\frac{d}{dx}\sigma(x) = \sigma(x) \cdot (1 - \sigma(x))$$


### 4. Why This Matters 
* **Efficiency:** Because the derivative depends only on the output of the Sigmoid function itself ($\sigma(x)$), it is computationally very "cheap" to calculate during backpropagation or gradient descent.
* **Gradient Descent:** When updating weights in Logistic Regression, you need this derivative to calculate the slope of the loss function and determine which direction to move the weights to minimize error.

![](/assets/sigmoid-fun.png)

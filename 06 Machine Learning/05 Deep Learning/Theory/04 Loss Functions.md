# Loss Functions

A loss function quantifies how far off the model's predictions are from the actual target values. It measures the "error" and guides the model during training.

Lower loss = better performance
Goal = minimize the loss function during training

## 📊 Categories of Loss Functions

| Task Type                      | Common Loss Functions                                       |
| ------------------------------ | ----------------------------------------------------------- |
| **Regression**                 | MSE, MAE, Huber                                             |
| **Binary Classification**      | Binary Cross-Entropy                                        |
| **Multi-Class Classification** | Categorical Cross-Entropy, Sparse Categorical Cross-Entropy |


## 🧮 Common Loss Functions

### 1. Mean Squared Error (MSE)
MSE measures the average squared difference between predictions and actual values.

$$
\text{MSE} = \frac{1}{n} \sum_{i=1}^{n} (y_i - \hat{y}_i)^2
$$

- Penalizes large errors more than small ones (due to squaring)
- Smooth and differentiable
- Sensitive to outliers


### 2. Mean Absolute Error (MAE)
MAE measures the average absolute difference between predictions and actual values.

$$
\text{MAE} = \frac{1}{n} \sum_{i=1}^{n} |y_i - \hat{y}_i|
$$

- Less sensitive and more robust to outliers than MSE
- Not differentiable at zero (can be problematic for optimization, but solvable with subgradients)

### 3. Huber Loss

$$
L_\delta(a) =
\begin{cases}
\frac{1}{2}(y - \hat{y})^2 & \text{if } |y - \hat{y}| \leq \delta \\
\delta \cdot (|y - \hat{y}| - \frac{1}{2} \delta) & \text{otherwise}
\end{cases}
$$

- Quadratic near 0, linear for large errors
- Balances MSE and MAE
- Balances MSE and MAE

### 4. Binary Cross-Entropy (BCE)
BCE measures the difference between predicted probabilities and actual labels (0 or 1). It's commonly used for binary classification problems.

$$
\text{BCE} = -\frac{1}{n} \sum_{i=1}^{n} \left[ y_i \log(\hat{y}_i) + (1 - y_i) \log(1 - \hat{y}_i) \right]
$$

$$
y \in \{0, 1\}, \quad \hat{y} \in (0, 1)
$$

### 5. Categorical Cross-Entropy (CCE)
CCE is an extension of BCE for multi-class classification problems.

$$
\text{CCE} = -\sum_{i=1}^{n} \sum_{j=1}^{C} y_{ij} \log(\hat{y}_{ij})
$$

where, 
- n is the number of samples,
- C is the number of classes,
- $y_{ij}$ is the true label for the i-th sample and j-th class,
- $\hat{y}_{ij}$ is the predicted probability for the i-th sample and j-th class.
- $y_{ij} \in \{0, 1\}$

 ## 🔄 Summary Table

 | Loss Function             | Use Case                     | Sensitive to Outliers | Output        |
| ------------------------- | ---------------------------- | --------------------- | ------------- |
| MSE                       | Regression                   | Yes                   | Continuous    |
| MAE                       | Regression                   | No                    | Continuous    |
| Huber                     | Regression                   | Less                  | Continuous    |
| Binary Cross-Entropy      | Binary Classification        | Yes                   | \[0,1]        |
| Categorical Cross-Entropy | Multi-Class                  | Yes                   | Probabilities |
| Sparse Categorical        | Multi-Class (labels as ints) | Yes                   | Probabilities |
| KL Divergence             | Distribution comparison      | Yes                   | Probabilities |

# Activation Functions

## 1. Sigmoid (Logistic) Function

$$
\sigma(x) = \frac{1}{1 + e^{-x}}
$$

| Property  | Value                                 |
| --------- | ------------------------------------- |
| **Range** | (0, 1)                                |
| **Use**   | Binary classification (output layer)  |
| **Pros**  | Smooth; probabilistic interpretation  |
| **Cons**  | Vanishing gradient; not zero-centered |

## 2. Tanh (Hyperbolic Tangent)

$$
\tanh(x) = \frac{e^x - e^{-x}}{e^x + e^{-x}}
$$

| Property  | Value                             |
| --------- | --------------------------------- |
| **Range** | (−1, 1)                           |
| **Use**   | Hidden layers in early RNNs       |
| **Pros**  | Zero-centered                     |
| **Cons**  | Vanishing gradient still possible |

## 3. ReLU (Rectified Linear Unit)

$$
\text{ReLU}(x) = \max(0, x)
$$

| Property  | Value                                               |
| --------- | --------------------------------------------------- |
| **Range** | \[0, ∞)                                             |
| **Use**   | Hidden layers in most modern networks               |
| **Pros**  | Fast, efficient; avoids vanishing gradient (mostly) |
| **Cons**  | **Dying ReLU** problem (neurons get stuck at 0)     |


## 4. Leaky ReLU

$$
\text{LeakyReLU}(x) =
\begin{cases}
x & \text{if } x \geq 0 \\
\alpha x & \text{if } x < 0
\end{cases}
$$

| Property  | Value                                        |
| --------- | -------------------------------------------- |
| **Range** | (−∞, ∞)                                      |
| **Use**   | Prevents dead neurons                        |
| **Pros**  | Allows small negative gradients              |
| **Cons**  | Small negative slope may still slow learning |

## 5. Parametric ReLU (PReLU)
Similar to Leaky ReLU but 𝛼 is learned during training. Learns optimal leak

## 6. ELU

$$
\text{ELU}(x) =
\begin{cases}
x & \text{if } x \geq 0 \\
\alpha (e^x - 1) & \text{if } x < 0
\end{cases}
$$

| Property | Value                                              |
| -------- | -------------------------------------------------- |
| **Pros** | Smooth transition; avoids dying neurons; zero mean |
| **Cons** | Slightly more expensive to compute                 |

## 7. SoftMax

$$
\text{Softmax}(z_i) = \frac{e^{z_i}}{\sum_{j=1}^{n} e^{z_j}}
$$

| Property  | Value                                       |
| --------- | ------------------------------------------- |
| **Range** | (0, 1), sums to 1                           |
| **Use**   | Multi-class classification (output layer)   |
| **Pros**  | Gives probability distribution over classes |
| **Cons**  | Not used in hidden layers                   |

## 🔁 Summary

| Activation | Range   | Use Case             | Gradient Issue             |
| ---------- | ------- | -------------------- | -------------------------- |
| Sigmoid    | (0, 1)  | Output (binary)      | Vanishing gradient         |
| Tanh       | (−1, 1) | Hidden layers        | Vanishing gradient         |
| ReLU       | \[0, ∞) | Hidden layers        | Dying ReLU                 |
| Leaky ReLU | (−∞, ∞) | Hidden layers        | Safer than ReLU            |
| PReLU      | (−∞, ∞) | Hidden layers        | Learnable slope            |
| ELU        | (−α, ∞) | Hidden layers        | Smooth; better convergence |
| Swish      | (−∞, ∞) | Hidden layers        | Newer; smooth              |
| Softmax    | (0, 1)  | Output (multi-class) | Used only at output        |



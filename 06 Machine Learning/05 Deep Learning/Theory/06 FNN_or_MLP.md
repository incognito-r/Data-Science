# Feedforward Neural Networks or Multilayer Perceptrons (MLPs)
A Feedforward Neural Network is the simplest type of artificial neural network where information moves in one direction — from input to output — through one or more hidden layers. It does not loop back (i.e., no cycles).

Input Layer → Hidden Layer(s) → Output Layer

Each layer:
    - Takes an input vector
    - Applies a linear transformation followed by a nonlinear activation

## Structure of a Feedforward Neural Network/MLP

1. Input layer
    - Takes in the feature vector (e.g., pixel values, tabular data),
    - No computation, just passes data to the next layer

2. Hidden layers
    - One or more layers of neurons,
    - Each neuron applies a linear transformation followed by a nonlinear activation function (e.g., sigmoid, ReLU)
    - Activation functions adds non-linearity to the model, allowing it to learn more complex relationships.

    $$
        z = \sum (w_i x_i) + b
    $$
    Then, the activation is applied:
    $$
        a = \text{activation}(z)
    $$

3. Output Layer
- Produces the final prediction
- Common activations:
    - Sigmoid for binary classification
    - Softmax for multi-class
    - Linear for regression

| Feature           | Description                                    |
| ----------------- | ---------------------------------------------- |
| Fully connected   | All neurons connected to the next layer        |
| No memory         | Doesn't retain temporal or spatial information |
| Static            | Fixed-size input and output                    |
| Non-convolutional | Treats each input feature independently        |

## 📦 When to Use MLP
- Tabular data (e.g., finance, medical)
- Small-scale problems (low dimensional)
- When spatial/temporal structure isn't important


## 📉 Limitations of MLP

| Limitation                 | Explanation                                                    |
| -------------------------- | -------------------------------------------------------------- |
| Large number of parameters | Fully connected layers scale poorly                            |
| No spatial awareness       | Can’t capture image patterns (no local connectivity like CNNs) |
| No temporal memory         | Can’t remember sequence information (unlike RNNs or LSTMs)     |
| Prone to overfitting       | Especially if network is deep or data is small                 |


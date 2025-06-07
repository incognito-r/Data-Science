# Neural Network
An artificial neural network (ANN) is a computational model inspired by the way biological neurons in the brain work. It consists of layers of interconnected nodes (neurons) that process input data and make predictions or classifications.

## 🏗️ Structure of a Neural Network
A basic ANN has three types of layers:

1. Input Layer: Accepts raw data (e.g., pixels of an image or features of a dataset). Each input node represents one feature.

2. Hidden Layers (1 or more): Each node receives input from the previous layer, processes it with a weight, bias, and activation function. Deeper networks = more hidden layers = more expressive power.

3. Output Layer: Produces the final prediction or classification based on the input data. Number of neurons = number of output classes (classification) or 1 (regression).

## 🔢 Neuron Computation

Each neuron performs a weighted sum followed by a non-linear activation:

$$
z = w_1 x_1 + w_2 x_2 + \dots + w_n x_n + b
$$

$$
a = \text{activation}(z)
$$

## 🎛️ Key Components

| Component               | Description                             |
| ----------------------- | --------------------------------------- |
| **Weights**             | Strength of connection between neurons  |
| **Bias**                | Shifts the activation function          |
| **Activation function** | Introduces non-linearity                |
| **Forward propagation** | Computation of output from input        |
| **Backpropagation**     | Updating weights using gradient descent |

## 🌐 Fully Connected Layer (Dense Layer)
- Every neuron is connected to every neuron in the next layer.
- Works well for simple tasks and tabular data, but becomes inefficient for large inputs (e.g., images).

## 📉 Training a Neural Network (Overview)
1. Initialize weights randomly
2. Forward pass to compute predictions
3. Compute loss using a loss function
4. Backpropagate error using gradients
5. Update weights using an optimizer (e.g., SGD, Adam)
6. Repeat steps 2–5 over multiple epochs



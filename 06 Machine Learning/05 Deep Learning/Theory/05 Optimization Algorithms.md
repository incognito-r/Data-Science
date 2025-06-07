# ⚙️ Gradient Descent & Optimization Algorithms

🚀 **Why Optimization?**
Once the loss is calculated, we need to minimize it to improve the model. That’s where optimization algorithms come in — they adjust the model's weights and biases to reduce the loss over time.

## Gradient Descent
Gradient Descent is an iterative optimization algorithm used to minimize the loss function by updating model parameters in the opposite direction of the gradient.

$$
\theta = \theta - \eta \nabla_\theta \mathcal{L}(\theta)
$$

where:
- $\theta$ is the model's parameters (weights and biases)
- $\eta$ is the learning rate (step size)
- $\nabla_\theta \mathcal{L}(\theta)$ is the gradient of the loss function with respect to the model's parameters.

**Learning Rate Pitfalls**

| Case       | Result                   |
| ---------- | ------------------------ |
| Too small  | Slow convergence         |
| Too large  | May overshoot or diverge |
| Just right | Fast and stable training |


## Types of Gradient Descent

| Type                    | Description                                  | Pros                | Cons                             |
| ----------------------- | -------------------------------------------- | ------------------- | -------------------------------- |
| **Batch GD**            | Uses the entire dataset to compute gradients | Stable              | Slow; memory-heavy               |
| **Stochastic GD (SGD)** | Uses one sample at a time                    | Fast, noisy updates | Noisy; may not converge smoothly |
| **Mini-batch GD**       | Uses small batches (e.g. 32, 64)             | Balanced            | Most widely used                 |

## 1. Stochastic Gradient Descent (SGD)
SGD is an online learning algorithm that uses a single sample(or a mini-batch) to update the model's parameters. It's fast but noisy. SGD is suitable for large datasets and can be parallelized. However, it may not converge smoothly. To mitigate this, we can use **momentum** or **Nesterov acceleration**. Same formula as GD, but applied to a random subset (mini-batch) of the data.

## 2. SGD with Momentum
Momentum helps SGD escape local minima by adding a fraction of the previous update to the current update. This is done by introducing a new variable, `v`, which accumulates the velocity of the updates. 

$$
v_t = \gamma v_{t-1} + \eta \nabla_\theta \mathcal{L}(\theta) \\
\theta = \theta - v_t
$$

where, $\gamma$ is the momentum coefficient(typically ~0.9).

## 3. RMS Prop
RMS Prop is a variant of SGD that adapts the learning rate for each parameter individually. It keeps a moving average of the squared gradients, which is used to normalize the gradients. This helps in stabilizing the updates. Works well for RNNs and noisy data.

## 4. Adam(Adaptive Moment Estimation) ⭐
AAdam optimizer combines the momentum and RMSprop techniques to provide a more balanced and efficient optimization process. It adapts the learning rate for each parameter and also keeps track of the first and second moments of the gradients. This helps in stabilizing the updates and improving convergence.

- Keeps running averages of both gradients and squared gradients.
- Uses these averages to normalize the gradients and update the parameters.
- Has a momentum-like component to help escape local minima.
- Has a learning rate decay component to prevent overshooting.
- Fast convergence
- Works well across many architectures


# Summary

| Optimizer      | Adaptive LR | Momentum | Popularity |
| -------------- | ----------- | -------- | ---------- |
| SGD            | ❌           | ❌        | ✅          |
| SGD + Momentum | ❌           | ✅        | ✅          |
| RMSProp        | ✅           | ❌        | ✅          |
| Adam           | ✅           | ✅        | ⭐⭐⭐        |


## 🔻 Problems Associated with Gradient Descent

1. **Local Minima**: Gradient Descent may converge to a local minimum where the gradients are 0, which is not the global minimum. A saddle point is where gradient = 0, but it's not a minimum — the loss goes down in one direction and up in another. In high-dimensional spaces, saddle points are more common than true local minima. 

Mitigation: Use multiple initializations, momentum, Adam, or noise (SGD's natural randomness) to escape.

2. **Vanishing Gradients**: In deep networks, gradients can become extremely small as they are backpropagated to earlier layers — especially with sigmoid or tanh activations. Early layers learn very slowly. Training stalls or converges very slowly.

Mitigation: Use ReLU activations, batch normalization, or residual connections to help gradients flow.

3. **Exploding Gradients**: In deep networks, gradients can become extremely large as they are backpropagate, especially in deep or recurrent networks. This can cause the model to diverge. It causes numerical instability and divergence.

Mitigation: Use gradient clipping, gradient normalization, or L2 regularization to prevent exploding gradients.










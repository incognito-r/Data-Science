# Convolutional Neural Network(CNN)

A Convolutional Neural Network is a type of neural network that is especially effective at capturing spatial hierarchies in images using:

1. Convolutional layers
2. Pooling layers
3. Fully connected layers

## 🧱 CNN Architecture

1. Input Layer
    - Input: An image (e.g., 28×28 grayscale → shape: shape:[1, 28, 28])
    - For color images: 3 channels (RGB) → shape: shape:[3, H, W]

2. Convolutional Layer
    - Applies learnable filters (kernels) to the input image.
    - Each filter slides over the input, performing dot products and creating a feature map.
    - Purpose: Detect low-level features like edges, lines.

    Key hyperparameters:

    - Filter size (e.g., 3×3)
    - Number of filters
    - Stride (step size)
    - Padding (adds borders to preserve spatial dimensions)

3. Activation Function (ReLU)
    - ReLU is applied to the output of convolution.
    -   Adds non-linearity: $f(x) = max(0,x)$

4. Pooling Layer (Downsampling)
    - Reduces spatial size to make computation faster and reduce overfitting.
    - Common: MaxPooling (e.g., 2×2)
    - Purpose: Keep the most important features.

5. Deeper Conv + Pooling Layers
    - As you go deeper, CNNs detect complex patterns (e.g., corners, shapes, objects).
    - Stacking layers allows for hierarchical feature extraction.

6. Flatten Layer
    - Converts 2D feature maps into 1D vectors before feeding into fully connected layers.

7. Fully Connected (Dense) Layers
    - Typical MLP layers.
    - Final layer's size = number of classes (e.g., 10 for digits 0-9).
    - Output uses softmax for classification.


FLow:
- Image → Conv → ReLU → Pool → Conv → ReLU → Pool → Flatten → FC → Softmax

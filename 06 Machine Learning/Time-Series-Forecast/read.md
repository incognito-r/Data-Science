# Time Series Forcasting

Time series forecasting is a statistical and machine learning technique used to predict future values based on historical data that is ordered over time. This type of data is often collected at regular intervals (e.g., daily, monthly, quarterly) and includes a temporal aspect, making it essential to account for patterns like trends, seasonality, and cyclicality.

## Key Components of Time Series Data

- Trend: The general direction in which the data is moving over time (e.g., upward or downward).
- Seasonality: Regular patterns that repeat over a specific period, like daily, weekly, or yearly (e.g., retail sales peaking in December).
- Cyclicality: Fluctuations that are not of a fixed period, often influenced by external economic factors.
- Noise: Random variation or irregular fluctuations that are not part of the actual pattern.

## Common Methods for Time Series Forecasting
**Statistical Methods:**
- ARIMA (Auto-Regressive Integrated Moving Average): Useful for univariate time series without strong seasonality.
- SARIMA (Seasonal ARIMA): Extends ARIMA to handle seasonality.
- Exponential Smoothing (ETS): Models trend and seasonality by giving more weight to recent data.

**Machine Learning and Deep Learning Models:**
- LSTM (Long Short-Term Memory): A neural network that handles sequential dependencies well.
- Prophet: A forecasting model developed by Facebook, good for data with strong seasonality.
- XGBoost and Random Forests: Tree-based models that can be used for time series with some modifications, though they’re typically more suited for non-sequential data.

## Types of Data

| Aspect        | Temporal Variation | Stationarity | Seasonality | Trend |
|---------------|--------------------|--------------|-------------|-------|
| Object        | Varies             | Does Not Vary| Varies      | Varies|
| Time          | Does Not Vary      | Varies       | Varies      | Varies|


## Time Series Analysis: 
- Univariate: It has only two features - Time and Target
- Multivariate: It has time, target and exog variables (X variable)

## Time Series Assumptions:
1. Series must be timed indexed.
2. No missing value at all
3. There must be auto-corelation.

## Equation

$y_t = f(y_{t-1}, y_{t-2}, y_{t-3}, y_{t-4})$

## Components of Time Series Analysis

**Trend ($T_t$)**: Represents the overall direction in which the time series data is moving, whether it is increasing, decreasing, or remaining stable.

- Positive: Indicates a long-term upward movement.
- Negative: Indicates a long-term downward movement.
- Sideways: Neither increasing nor decreasing, indicating stability over time.

**Seasonality ($S_t$)**: Refers to periodic fluctuations in data that occur over a period of less than a year (e.g., hourly, daily, weekly). It captures repetitive patterns or cycles at consistent intervals.

**Cyclicity ($C_t$)**: Describes patterns or cycles that recur over a period longer than a year, often tied to economic or business cycles.

**Irregular Term ($I_t$)**: If we remove the trend , seasonality from the Series , left over / data without pattern is called residual Represents random, unpredictable variations in the time series, often caused by factors outside the control of the system. It accounts for residual fluctuations that are not explained by trends, seasonality, or cyclic components.


## Stationary Series: 
A series is said to be stationary if its mean and variance are constant over a period of time because if not then we cant run ARIMA(Auto-regressive Integrated Moving Average) model. To check stationarity we can use graphs or hypothesis testing.

To convert a stationary series to moving series several method are used. 
- Detrend (Remove the trend)  - ARMIA (Autoregressive Integrated Moving Average
)
- Deseasoning
- Transform



### Techniques for Time Series Forecasting

| **Basic**                   | **Intermediate**                                          | **Advanced**       | **Very Advanced** |
|-----------------------------|-----------------------------------------------------------|---------------------|--------------------|
| Simple Moving Average       | Decomposition                                            | AR (Autoregression) | VAR (Vector Autoregression) |
| Weighted Moving Average     | Exponential Smoothing Techniques (e.g., Holt-Winters)    | MA (Moving Average) | ARCH (Autoregressive Conditional Heteroskedasticity) |
| Centered Moving Average     | Single Exponential Smoothing                             | ARMA (Autoregressive Moving Average) | GARCH (Generalized ARCH) |
|                             | Double Exponential Smoothing                             | ARIMA (Autoregressive Integrated Moving Average) | Wavelet Transform |
|                             | Triple Exponential Smoothing (Holt-Winters)              | SARIMA (Seasonal ARIMA) | RNN (Recurrent Neural Network) |
|                             |                                                          | ARIMAX (ARIMA with Exogenous Variables) | LSTM (Long Short-Term Memory) |
|                             |                                                          | SARIMAX (Seasonal ARIMA with Exogenous Variables) | GRU (Gated Recurrent Unit) |


### Decomposition: 
Time series decomposition involves breaking down a time series into its fundamental components to better understand the underlying patterns. This approach helps to separate and analyze distinct influences on the data.


The common decomposition model are: 

Additive: 
$$
Y_t = T_t + S_t + C_t + I_t
$$

Multiplicative: 
$$
Y_t = T_t \times S_t \times C_t \times I_t
$$

### Exponential Moving Average: 
The Exponential Moving Average (EMA) is a type of moving average that places a greater weight and significance on the most recent data points. Unlike the Simple Moving Average (SMA), which gives equal weight to all observations in a period, EMA assigns exponentially decreasing weights as the observations get older. This approach makes EMA more responsive to recent price changes, making it popular in time series forecasting and financial analysis.

The formula for the Exponential Moving Average (EMA) at time $t$ is given by:

$$
\text{EMA}_t = \alpha \cdot X_t + (1 - \alpha) \cdot \text{EMA}_{t-1}
$$

where:
- $X_t$ is the current value or observation.
- $\alpha$ is the smoothing factor, calculated as $\alpha = \frac{2}{n + 1}$.
- $\text{EMA}_{t-1}$ is the EMA value from the previous period.
- $n$ is the number of periods for calculating the EMA.
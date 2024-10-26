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

## Components of ....

**Trend ($T_t$)**: Ouantity is either increasing or decereasing.
- Positive: Increasing
- Negative: Decresing
- Sideways: Neither increasing nor decreasing

**Seasonality ($S_t$)**: Over a period of time demand repeats but less than a year (hourly, daily, weekly, etc).

**Cyclicity ($C_t$)**: Over a period of time more than a year, demand repeats.

**Irregular Term ($I_t$)**: Irregular term represents random, unpredictable variations in the time series. It accounts for any noise or residual fluctuations that cannot be explained by trends, seasonality, or cyclic components.

### Decomposition: ()
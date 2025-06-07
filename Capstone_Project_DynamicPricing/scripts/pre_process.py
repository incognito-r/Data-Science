import pandas as pd

# CPI data from 2009 to 2015 (you can adjust the values as needed)
cpi_data = {
    2009: 214.537,
    2010: 218.056,
    2011: 224.939,
    2012: 229.594,
    2013: 232.957,
    2014: 236.736,
    2015: 237.017
}

cpi_2025 = 319.082  # Projected CPI for 2025

def calculate_inflation_factor(year):
    # Map inflation factor using CPI data and the projected CPI for 2025
    inflation_factor = cpi_2025 / cpi_data.get(year, cpi_data[2015])  # Default to 2015 CPI if missing
    return inflation_factor

def calculate_surge_factor(ride_datetime, passenger_count):
    # Example surge factor logic based on time of day and passenger count
    hour = ride_datetime.hour
    if hour >= 1 and hour <= 6:
        surge_factor = 1.0  # No surge
    elif hour >= 18 and hour <= 22:
        surge_factor = 2  # rush hour
    else:
        surge_factor = 1.5  # moderate
    
    # Adjust surge factor based on passenger count
    if passenger_count > 4:
        surge_factor *= 1.2  # Increase surge for larger groups
    
    return surge_factor

def preprocess_input_data(user_input):
    # Convert ride_datetime from string to datetime format
    user_input['ride_datetime'] = pd.to_datetime(user_input['ride_datetime'])
    
    # Extract year, month, and day of the week from datetime
    user_input['year'] = user_input['ride_datetime'].dt.year
    user_input['month'] = user_input['ride_datetime'].dt.month
    user_input['day_of_week'] = user_input['ride_datetime'].dt.dayofweek
    
    # Calculate surge factor and inflation factor
    user_input['Surge_Factor'] = user_input.apply(
        lambda row: calculate_surge_factor(row['ride_datetime'], row['passenger_count']), axis=1)
    user_input['inflation_factor'] = user_input['year'].apply(calculate_inflation_factor)
    
    # Make sure the user input DataFrame matches the model's expected feature columns
    required_columns = ['passenger_count', 'distance_km', 'year', 'month', 'day_of_week', 'Surge_Factor', 'inflation_factor']
    
    # If any missing columns are in the user input, add them with default values (e.g., 0 or NaN)
    for col in required_columns:
        if col not in user_input.columns:
            user_input[col] = 0  # You can set appropriate default values based on the feature's nature
    
    # Ensure the columns are in the same order as required by the model
    user_input = user_input[required_columns]
    
    return user_input

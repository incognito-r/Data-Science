import pandas as pd
import joblib
import numpy as np

# Load preprocessing objects
default_values = joblib.load("model/default_values.pkl")  # Default values for missing inputs

def preprocess_data(user_data_dict):

    # Fill missing values with defaults
    for key, value in default_values.items():
        if key not in user_data_dict or user_data_dict[key] is None or user_data_dict[key] == "":
            user_data_dict[key] = value  # Assign default value

    # Convert user input to DataFrame
    df = pd.DataFrame([user_data_dict])

    # Encode categorical variables before dummy encoding
    df["Vehicle_Type"] = df["Vehicle_Type"].map({"Economy": 0, "Premium": 1})

    loyalty_mapping = {"Regular": 1, "Silver": 2, "Gold": 3}
    df["Customer_Loyalty_Status"] = df["Customer_Loyalty_Status"].map(loyalty_mapping)

    # Create new features before one-hot encoding
    df["Demand_Supply_Ratio"] = df["Number_of_Riders"] / (df["Number_of_Drivers"] + 0.5)


    peak_hours = ["Morning", "Evening"]
    df["Peak_Hour"] = df["Time_of_Booking"].apply(lambda x: 1 if x in peak_hours else 0)

    # List of expected dummy columns (from training)
    dummy_cols = ["Location_Category_Suburban", "Location_Category_Urban", 
                  "Time_of_Booking_Evening", "Time_of_Booking_Morning", "Time_of_Booking_Night"]

    # Initialize missing dummy columns with False
    dummy_cols_init = {col: False for col in dummy_cols}

    # Apply one-hot encoding
    df_encoded = pd.get_dummies(df, columns=["Location_Category", "Time_of_Booking"])

    # Extract first row as dictionary and update missing columns
    dummy_cols_init.update(df_encoded.iloc[0].to_dict())

    # Convert back to DataFrame with correct column order
    final_df = pd.DataFrame([dummy_cols_init])

    rearange_cols = ['Number_of_Riders', 'Number_of_Drivers', 'Customer_Loyalty_Status',
       'Number_of_Past_Rides', 'Average_Ratings', 'Vehicle_Type',
       'Expected_Ride_Duration', 'Location_Category_Suburban',
       'Location_Category_Urban', 'Time_of_Booking_Evening',
       'Time_of_Booking_Morning', 'Time_of_Booking_Night',
       'Demand_Supply_Ratio', 'Peak_Hour']

    final_df = final_df[rearange_cols]

    # Add non-categorical columns to `final_df`
    final_df["Vehicle_Type"] = df["Vehicle_Type"].values
    final_df["Customer_Loyalty_Status"] = df["Customer_Loyalty_Status"].values
    final_df["Demand_Supply_Ratio"] = df["Demand_Supply_Ratio"].values
    final_df["Peak_Hour"] = df["Peak_Hour"].values

    return final_df

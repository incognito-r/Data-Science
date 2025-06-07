import streamlit as st
import pandas as pd
import joblib
from scripts.pre_process import preprocess_input_data

# Load the trained model
model = joblib.load('model/rf_model.pkl')  # Update with the correct model path

# Title and description for the web app
st.title("Uber Fare Prediction")
st.write("Enter the ride details below to predict the optimal fare amount for a ride.")

# Create input fields for user inputs
passenger_count = st.number_input("Passenger Count", min_value=1, max_value=6, value=1)
distance_km = st.number_input("Distance (km)", min_value=0.1, value=1.0)
ride_datetime = st.text_input("Ride DateTime (YYYY-MM-DD HH:MM:SS)", "2023-03-30 12:00:00")

# Button to predict
if st.button("Predict Fare"):
    # Prepare the user input into a DataFrame
    user_input = pd.DataFrame({
        'passenger_count': [passenger_count],
        'distance_km': [distance_km],
        'ride_datetime': [ride_datetime],  # Include the ride_datetime column
    })

    # Preprocess the input data (extract year, month, day of the week, calculate surge and inflation factors)
    user_input_processed = preprocess_input_data(user_input)

    st.write(user_input_processed.head())
    # Predict the fare using the trained model
    fare_prediction = model.predict(user_input_processed)

    # Display the predicted fare
    st.write(f"Predicted Optimal Fare: ${fare_prediction[0]:.2f}")

import streamlit as st
import joblib
import numpy as np
import pandas as pd

# Load trained model and scaler
def load_model_and_scaler():
    model = joblib.load("model/dynamic_pricing_model.pkl")  # Load trained model
    scaler = joblib.load("model/scaler.pkl")  # Load StandardScaler
    return model, scaler

# Function to predict ride price
def predict_price(model, scaler, user_input):
     # Apply the same scaling as in training
    return  # Predict using trained model

# Streamlit App
def main():
    st.title("🚕 Dynamic Pricing Prediction for Ride-Sharing")
    st.write("Enter ride details to predict the optimal fare.")

    # User Inputs
    num_riders = st.number_input("Number of Riders", min_value=0, value=5)
    num_drivers = st.number_input("Number of Drivers", min_value=0, value=3)
    past_rides = st.number_input("Number of Past Rides", min_value=0, value=10)
    avg_ratings = st.slider("Average Ratings", 1.0, 5.0, 4.5)
    ride_duration = st.number_input("Expected Ride Duration (mins)", min_value=1, value=15)
    location = st.selectbox("Select Location Category", ["Urban", "Suburban", "Rural"])
    loyalty_status = st.selectbox("Select Customer Loyalty Status", ["Regular", "Silver", "Gold"])
    time_of_booking = st.selectbox("Select Time of Booking", ["Morning", "Afternoon", "Evening", "Night"])
    vehicle_type = st.selectbox("Select Vehicle Type", ["Economy", "Premium"])

    # Prepare user input dictionary
    user_data = {
        "Number_of_Riders": num_riders,
        "Number_of_Drivers": num_drivers,
        "Location_Category": location,
        "Customer_Loyalty_Status": loyalty_status,
        "Number_of_Past_Rides": past_rides,
        "Average_Ratings": avg_ratings,
        "Time_of_Booking": time_of_booking,
        "Vehicle_Type": vehicle_type,
        "Expected_Ride_Duration": ride_duration
    }
    
    from scripts.preprocess import preprocess_data
    processed_df = preprocess_data(user_data)

    st.write("Processed User Data:", processed_df)

    # Predict Price
    if st.button("Predict Price"):
        model, scaler = load_model_and_scaler()  # Load model and scaler
        df_scaled = scaler.transform(processed_df) 
        price = model.predict(df_scaled)[0]  # Predict price
        st.success(f"Predicted Optimal Fare: **${price:.2f}** 💰")

# Run the app
if __name__ == "__main__":
    main()

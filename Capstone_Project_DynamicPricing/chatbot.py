import os
import pandas as pd
import joblib
from dotenv import load_dotenv

# 🛠️ UPDATED imports
from langchain_openai import ChatOpenAI
from langchain_core.messages import AIMessage, HumanMessage

from scripts.pre_process import preprocess_input_data

# Load environment variables
load_dotenv()

# Load the trained model
model = joblib.load("model/rf_model.pkl")  # Ensure this path is correct

# Initialize LangChain chat model (use DeepSeek via OpenRouter)
chat_model = ChatOpenAI(
    base_url="https://openrouter.ai/api/v1",
    api_key=os.getenv("DEEPSEEK_API_KEY"),
    model="deepseek/deepseek-r1"
)

def predict_fare(passenger_count, distance_km, ride_datetime):
    user_input = pd.DataFrame({
        'passenger_count': [passenger_count],
        'distance_km': [distance_km],
        'ride_datetime': [ride_datetime],
    })

    # Preprocess input
    processed_input = preprocess_input_data(user_input)

    # Predict fare
    fare_prediction = model.predict(processed_input)
    return round(fare_prediction[0], 2)

def chat():
    print("🚖 Uber Fare Chatbot - Type 'exit' to quit\n")
    
    while True:
        user_message = input("You: ")
        
        if user_message.lower() == "exit":
            print("Chatbot: Have a great day! 🚕")
            break

        # Send user input to LLM
        response = chat_model.invoke([
            HumanMessage(content=f"Extract ride details from: {user_message}")
        ])
        
        ai_reply = response.content
        
        # Here, parse ride details (mock example, replace with actual parsing)
        passenger_count = 1  # Extracted from response (to be improved)
        distance_km = 5.0  # Extracted from response
        ride_datetime = "2025-04-02 15:00:00"  # Extracted from response

        # Predict fare
        fare = predict_fare(passenger_count, distance_km, ride_datetime)
        
        print(f"Chatbot: Based on your details, the estimated fare is ${fare:.2f}.")

if __name__ == "__main__":
    chat()

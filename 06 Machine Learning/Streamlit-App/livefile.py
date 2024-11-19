import streamlit as st 
import pandas as pd
import numpy as np
from sklearn.linear_model import LinearRegression, LogisticRegression
from sklearn.tree import DecisionTreeClassifier
from sklearn.ensemble import RandomForestClassifier
from sklearn.model_selection import train_test_split
from sklearn import metrics
import matplotlib.pyplot  as plt
import pickle
import seaborn as sns

st.header("Creating page for live prediction")
st.write("Please Enter the following details")
st.title("Loan Application form")

usr_name = st.text_input("Name: ")
usr_contact = st.text_input("Mobile No: ", max_chars=10)
usr_email = st.text_input("Email: ")
usr_pan_card = st.text_input("PAN: ", max_chars=10)

usr_age = st.number_input("Age: ", min_value=18, max_value=55)
usr_gender = st.selectbox("Gender: ", ['Male', 'Female'])
usr_education = st.selectbox("Gender: ", ['Master', 'High School', 'Bachelor'])
usr_income=st.number_input("Income:")
usr_emp_exp = st.slider("Experiesnce", min_value=0, max_value=40)
usr_home_ownership = st.selectbox('Home Ownership: ', ["RENT", "MORTAGE","OWN", "OTHER"])
usr_loan_amt = st.number_input("Loan AMount: ", min_value=50000)
usr_loan_intent = st.selectbox("Reason for Loan", ["PERSONAL", 'EDUCATION','MEDICAL' 'VENTURE', 'HOME IMPROVEMENT', 'DEBT CONSOLIDATION'])

usr_loan_int_rate = st.number_input("Interest Rate: ", min_value=0, max_value=24.5)

usr_loan_percent_income=st.number_input("Debt to Income Ratio:", min_value=0.0, max_value=1.0)
usr_cred_hist_length=st.slider("Total Time from First Loan Taken:", min_value=0, max_value=20)
usr_credit_score=st.number_input("Credit Score", min_value=300, max_value=950)
usr_previous_loan_defaults_on_file=st.selectbox("Defaulted previously:", ["Yes", "No"])




if st.button("submit"):
    data=pd.DataFrame([{
        "Name":usr_name,
        "Email":usr_email,
        "Contact":usr_contact,
        "PanCard":usr_contact,
        "person_age":usr_age,
        "person_gender":usr_gender,
        "person_education":usr_education,
        "person_income":usr_income,
        "person_emp_exp":person_emp_exp,
        "person_home_ownership":person_home_ownership,
        "loan_amnt":loan_amnt,
        "loan_intent":loan_intent,
        "loan_int_rate":loan_int_rate,
        "loan_percent_income":loan_percent_income,
        "cb_person_cred_hist_length":cb_person_cred_hist_length,
        "credit_score":credit_score,
        "previous_loan_defaults_on_file":previous_loan_defaults_on_file
    }])
    st.write("Please check filled Data:", data.head(1))

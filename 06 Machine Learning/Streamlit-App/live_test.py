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
print("\nPackages are imported\n")


# model=pickle.load("ML.pickle", "r")
with open("ML.pickle", "rb") as f:
    model=pickle.load(f)
with open("train.pickle", "rb") as g:
    train=pickle.load(g)




st.header("Creating page for live prediction for Loan Approval:")
st.write("Please enter these following details to get approval in just 10 sec:")


st.title("Loan Application Form")
Name=st.text_input("Full Name :")
Email=st.text_input("Email Address : ")
Contact=st.text_input("Mobile No.:", max_chars=10)
PanCard=st.text_input("Pan No.: ", max_chars=10)
person_age=st.number_input("Age: ", min_value=18, max_value=55)
person_gender=st.selectbox("Gender: ", ["male", "female" ])


person_education=st.selectbox("education:", ["Master", "High School", "Bachelor","Associate","Doctrate"])
person_income=st.number_input("Income:")
person_emp_exp=st.slider("Experience: ",min_value=0, max_value=40)
person_home_ownership=st.selectbox("Home Owner Ship: ", ["RENT", "MORTAGE","OWN", "OTHER"])
loan_amnt=st.number_input("Loan Amount:", min_value=50000)
loan_intent=st.selectbox("Reason for Loan:", ["PERSONAL", "EDUCATION","MEDICAL",\
    "VENTURE", "HOMEIMPROVEMENT", "DEBTCONSOLIDATION"])
loan_int_rate=st.number_input("Interest Rate: ", min_value=0.0, max_value=24.5)
loan_percent_income=st.number_input("Debt to Income Ratio:", min_value=0.0,
                                    max_value=1.0)
cb_person_cred_hist_length=st.slider("Total Time from First Loan Taken:", min_value=0, max_value=20)
credit_score=st.number_input("Credit Score", min_value=300, max_value=950)
previous_loan_defaults_on_file=st.selectbox("Defaulted previously:", ["Yes", "No"])


if st.button("submit"):
    data=pd.DataFrame([{
        "Name":Name,
        "Email":Email,
        "Contact":Contact,
        "PanCard":PanCard,
        "person_age":person_age,
        "person_gender":person_gender,
        "person_education":person_education,
        "person_income":person_income,
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
    data.to_csv("File.csv")
    data_for_output=data[["person_age", "person_gender", "person_education", "person_income",\
        "person_emp_exp", "person_home_ownership", "loan_amnt", "loan_intent",\
            "loan_int_rate", "loan_percent_income", "cb_person_cred_hist_length",\
                "credit_score", "previous_loan_defaults_on_file"]]
    test=pd.get_dummies(data_for_output)
    test1=test.reindex(columns=train.columns, fill_value=0)
    # st.write(test1.columns)
    # st.write(train.columns)
    a=model.predict(test1)
    p=model.predict_proba(test1)
    if credit_score<=600:
        st.write("Sorry! As of now We can not proceed with your aplication. You may try after some time")
    else:
        if a==1:
            st.write("Congrates! your loan amount", loan_amnt ,\
                "is approved with interest rate :",loan_int_rate)
        else:
            st.write("Sorry! As of now We can not proceed with your aplication. You may try after some time")
       
       




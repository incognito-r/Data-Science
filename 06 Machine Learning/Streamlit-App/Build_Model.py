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
# st.title("Hello World")
# st.header("Hello Header")
# st.subheader("Hello Sub header")
# st.text("Hello dfvgbjnkdnefvkgnbvkrfnkgbnjmdefvknjfrnknewfknk")
# st.markdown("## this is markdown")
# st.success("success : model saved sucessfull")
# st.info("Information")
# st.image("imartituc.jpg")


st.title("Choose your own Classification model and data")
st.latex("y=mx+c")
st.latex("x^{2}+y^{2}= r^{2}")


st.write("Please choose your file")
data_file=st.file_uploader("Choose data: ",type="csv" )


# cs=pd.read_csv(data_file)
df=pd.read_csv(data_file)
st.write("Data shape", df.shape)
ob_col=df.select_dtypes(include="object").columns.to_list()
num_col=df.select_dtypes(exclude="object").columns.to_list()
st.write("Numerical column list", num_col)
st.write("Objective column list", ob_col)


st.write("Top 5 row", df.head(5))


df.dropna(inplace=True)
st.sidebar.header("Select the Target Variable")


Columns_name=list(df.columns)
Target_var=st.sidebar.selectbox("Target Variable", Columns_name)
cs1=df.drop(columns=[Target_var])


cs2=pd.get_dummies(cs1)
x_features=list(cs2.columns)
st.sidebar.header("For x features")
independent_features=st.sidebar.multiselect("X features ", x_features, x_features)


y=df[Target_var]
x=cs2[independent_features]
x_train, x_test, y_train, y_test=train_test_split(x,y,
                                                  test_size=.3,
                                                  random_state=0)




st.sidebar.header("Select the model of your choice:")
model=st.sidebar.selectbox("models", ("LogR", "DT", "RF"))
if model=="LogR":
    ml=LogisticRegression()
    ml.fit(x_train, y_train)
    st.write("Train Accuracy:", ml.score(x_train, y_train))
    st.write("Test Accuracy:", ml.score(x_test, y_test))
    # pd.DataFrame({})
elif model=="DT":
    st.sidebar.write("Please choose parameters for DT")
    d=st.sidebar.slider("select max_depth", 2, 20)
    spliting_criterion=st.sidebar.selectbox("select spliting criterion" , ("gini", "entropy"))
    ml=DecisionTreeClassifier(max_depth=d, criterion=spliting_criterion)
    ml.fit(x_train, y_train)
    st.write("Train Accuracy:", ml.score(x_train, y_train))
    st.write("Test Accuracy:", ml.score(x_test, y_test))
    f_imp=pd.DataFrame({"Var":x_train.columns, "imp":ml.feature_importances_}).sort_values(by="imp", ascending=False)
    st.write("Feature Importance", f_imp)
   
with open("ML.pickle", "wb") as f:
    pickle.dump(ml, f)
with open("train.pickle", "wb") as g:
    pickle.dump(x_train, g)
st.success("Model saved Successully!")


# st.write()




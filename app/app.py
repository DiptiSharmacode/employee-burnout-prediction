import streamlit as st
import pandas as pd
import joblib
import os

# Base project directory
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

# Model path
model_path = os.path.join(
    BASE_DIR,
    "models",
    "burnout_pipeline.pkl"
)

# Load model
model = joblib.load(model_path)

# ==============================
# Streamlit Page Config
# ==============================

st.set_page_config(
    page_title="AI Workforce Burnout Prediction",
    layout="centered"
)

st.title("AI Workforce Burnout Prediction System")

st.write(
    "Enter employee details below to predict burnout rate."
)

# ==============================
# User Inputs
# ==============================

gender = st.selectbox(
    "Gender",
    ["Male", "Female"]
)

company_type = st.selectbox(
    "Company Type",
    ["Service", "Product"]
)

wfh = st.selectbox(
    "WFH Setup Available",
    ["Yes", "No"]
)

designation = st.selectbox(
    "Designation",
    [0, 1, 2, 3, 4, 5]
)

resource_allocation = st.slider(
    "Resource Allocation",
    min_value=1,
    max_value=10,
    value=5
)

mental_fatigue_score = st.slider(
    "Mental Fatigue Score",
    min_value=0.0,
    max_value=10.0,
    value=5.0
)

experience_years = st.slider(
    "Experience Years",
    min_value=0,
    max_value=20,
    value=5
)

# ==============================
# Prediction
# ==============================

if st.button("Predict Burnout Rate"):

    input_df = pd.DataFrame({
        "Gender": [gender],
        "Company Type": [company_type],
        "WFH Setup Available": [wfh],
        "Designation": [designation],
        "Resource Allocation": [resource_allocation],
        "Mental Fatigue Score": [mental_fatigue_score],
        "Experience_Years": [experience_years]
    })

    prediction = model.predict(input_df)[0]

    st.success(
        f"Predicted Burnout Rate: {prediction:.2f}"
    )

    # Burnout Category
    if prediction < 0.33:
        st.info("Low Burnout Risk")

    elif prediction < 0.66:
        st.warning("Medium Burnout Risk")

    else:
        st.error("High Burnout Risk")
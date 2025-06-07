import pandas as pd
import numpy as np
import random

np.random.seed(42)

n = 1000

# Age (skewed toward younger)
age = np.random.normal(loc=35, scale=10, size=n).astype(int)
age = np.clip(age, 18, 65)

# Education levels with skew
education_levels = ['High School', 'Bachelor', 'Master', 'PhD']
education_probs = [0.45, 0.35, 0.15, 0.05]
education = np.random.choice(education_levels, size=n, p=education_probs)

# Introduce typo or rare level
education[np.random.choice(n, size=10)] = 'Bachlor'  # typo

# Marital status with some imbalance
marital_status = np.random.choice(['Single', 'Married', 'Divorced'], size=n, p=[0.55, 0.35, 0.10])

# Job Type with some noise
job_types = ['Blue Collar', 'White Collar', 'Management', 'Tech', 'Healthcare']
job = np.random.choice(job_types, size=n)
job[np.random.choice(n, 5)] = 'Other'  # rare category

# Experience depends on age (but not clean)
experience = age - np.random.normal(18, 5, size=n)
experience = np.clip(experience, 0, 45).astype(int)

# Work hours with some outliers
hours_per_week = np.random.normal(40, 7, size=n).astype(int)
hours_per_week = np.clip(hours_per_week, 15, 80)
hours_per_week[np.random.choice(n, 10)] = np.random.choice([5, 90], size=10)  # outliers

# Base income logic with noise
base_income = (
    20000 +
    age * 400 +
    experience * 1000 +
    hours_per_week * 200 +
    [education_levels.index(e) * 15000 if e in education_levels else 8000 for e in education] +
    [job_types.index(j) * 10000 if j in job_types else 5000 for j in job] +
    np.random.normal(0, 20000, n)  # more noise
)

income = np.round(base_income / 1000, 2)

# Classification target with imbalance
high_income = (income > 85).astype(int)
imbalance_mask = np.random.choice([0, 1], size=n, p=[0.9, 0.1])
high_income = np.where(imbalance_mask == 1, 1, high_income)

# Introduce missing values
df = pd.DataFrame({
    'age': age,
    'education_level': education,
    'marital_status': marital_status,
    'job_type': job,
    'work_experience': experience,
    'hours_per_week': hours_per_week,
    'income': income,
    'high_income': high_income
})

# Randomly assign missing values
for col in ['education_level', 'job_type', 'work_experience']:
    df.loc[df.sample(frac=0.05).index, col] = np.nan

print("Data Saved")
# save the dataset
df.to_csv("income.csv", index=False)

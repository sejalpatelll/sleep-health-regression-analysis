# Sleep Health & Lifestyle — Regression Analysis in R

**Course:** Applied Regression Analysis (STAT 4355) — The University of Texas at Dallas  
**Team:** SnoozeStats — Sejal Patel, Kinsie Kim, Pei Chan Lin Liu

---

## Overview

This project applies multiple linear regression to identify the strongest predictors of sleep duration using the Sleep Health and Lifestyle dataset from Kaggle. The full statistical modeling pipeline was implemented in R, including exploratory data analysis, multicollinearity detection, variable selection, regularization, and residual analysis across 400 individuals.

---

## Dataset

- **Source:** [Sleep Health and Lifestyle Dataset — Kaggle](https://www.kaggle.com/datasets/uciml/sms-spam-collection-dataset)
- **Size:** 400 individuals, 13 variables
- **Response Variable:** Sleep Duration (hours)
- **Predictors:** Age, Gender, Occupation, Physical Activity, Stress Level, BMI Category, Blood Pressure (Systolic/Diastolic), Heart Rate, Daily Steps, Sleep Disorder, Sleep Quality

---

## Project Pipeline

### 1. Data Cleaning
- Removed `Person.ID` (non-informative)
- Standardized BMI categories (`"Normal Weight"` → `"Normal"`)
- Split `Blood Pressure` into `SystolicBP` and `DiastolicBP`
- Converted categorical variables to factors

### 2. Exploratory Data Analysis
- Histograms of sleep duration by gender, age group, and sleep disorder
- Box plots by stress level, BMI category, and age group
- Bar plots of stress level distribution across occupations
- Key finding: engineers sleep the most on average; sales representatives the least

### 3. Full Model
- Fit multiple linear regression with all 12 predictors
- Multiple R² = 0.9118, Adjusted R² = 0.906

### 4. Multicollinearity — VIF Analysis
- Detected high multicollinearity in `DiastolicBP` (GVIF > 10)
- Removed `DiastolicBP` to reduce variance inflation

### 5. Variable Selection — Stepwise AIC
- Forward stepwise selection starting from the null model
- Final reduced model dropped `Gender` (p-value = 0.3886, not significant)
- Confirmed via ANOVA: reduced model is a better fit

### 6. LASSO Regularization
- Applied LASSO regression to further validate predictor selection
- λ.min = 0.001585
- Zeroed out: Gender, Occupation, BMI Category, DiastolicBP, Sleep Disorder
- Key positive predictors: Sleep Quality, Physical Activity, Heart Rate
- Key negative predictors: Stress Level, Systolic BP, Daily Steps

### 7. Box-Cox Transformation
- Box-Cox curve peaked at λ ≈ 0.5 → square root transformation applied
- Improved normality of residual distribution

### 8. Residual Analysis
- Pre- and post-transformation residual histograms compared
- Post-transformation residuals more normally distributed

---

## Final Model
Sleep_Duration = 6.436 + Sleep_Quality + Occupation + Stress_Level + Physical_Activity + SystolicBP + Daily_Steps + Age + Sleep_Disorder + Heart_Rate + BMI_Category
- **Multiple R²:** 0.9022  
- **Adjusted R²:** 0.8961  
- All retained predictors statistically significant (p < 0.05)

---

## Key Findings

- Higher sleep quality, physical activity, and heart rate are associated with longer sleep duration
- Higher stress levels, systolic blood pressure, and daily steps are associated with shorter sleep duration
- Occupation is a significant predictor — engineers average the most sleep, sales representatives the least

---

## Files

- `STAT_4355_Project.Rmd` — Main analysis and modeling
- `Updated_Project_Models.Rmd` — Revised models with transformation and LASSO
- `STAT_4355_Sleep_Project.R` — R script version
- `sleep.csv` — Dataset
- `Sleep_Health_and_Lifestyle_Study_STAT_4355_Project.pdf` — Final presentation

---

## Tech Stack

- R
- RMarkdown
- ggplot2
- glmnet (LASSO)
- MASS (Box-Cox)
- car (VIF)

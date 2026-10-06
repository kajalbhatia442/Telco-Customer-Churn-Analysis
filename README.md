# Telco-Customer-Churn-Analysis
End-to-end telecom customer churn analysis using Excel, SQL, Python and Power BI

# 📊 Telecom Customer Churn & Retention Analytics

## 📌 Project Overview

This project analyzes customer churn for a telecommunications company to identify the key factors influencing customer attrition and determine high-risk customer segments.

The project follows an **end-to-end Data Analytics approach**, covering data cleaning, exploratory analysis, SQL analysis, statistical analysis, visualization, and customer churn prediction.

---

## 🎯 Business Problem

Customer churn directly affects revenue and customer retention. The objective of this analysis is to answer:

* What percentage of customers are churning?
* Which contract types have the highest churn?
* Which services are associated with higher churn?
* How does customer risk level relate to churn?
* Which customer segments should the company prioritize for retention?
* What actionable strategies can reduce customer churn?

---

## 📂 Dataset

**Dataset:** Telecom Customer Churn Dataset

* Total Customers: **7,043**
* Churned Customers: **1,869**
* Overall Churn Rate: **26.54%**
* Duplicate Customer IDs: **0**
* Missing Values: **0**

---

## 🛠️ Tools & Technologies

| Tool                 | Purpose                                                       |
| -------------------- | ------------------------------------------------------------- |
| **Excel**            | Data cleaning, EDA, PivotTables and preliminary analysis      |
| **SQL**              | Customer segmentation, aggregation and churn analysis         |
| **Python**           | Data cleaning, EDA, statistical analysis and machine learning |
| **Power BI**         | Interactive dashboard and business visualization              |
| **Statistics**       | Churn rate and relationship analysis                          |
| **Machine Learning** | Customer churn prediction                                     |

---

## 🔍 Key Analysis

### 1. Contract Analysis

Month-to-month customers have a significantly higher churn rate compared with customers on one-year and two-year contracts.

| Contract       | Churn Rate |
| -------------- | ---------: |
| Month-to-month | **42.71%** |
| One year       | **11.27%** |
| Two year       |  **2.83%** |

### 2. Internet Service Analysis

Fiber-optic customers show a considerably higher churn rate than DSL customers.

| Internet Service    | Churn Rate |
| ------------------- | ---------: |
| Fiber optic         | **41.89%** |
| DSL                 | **18.96%** |
| No internet service |  **7.40%** |

### 3. Risk Score Analysis

Churn increases substantially as the customer risk score increases.

| Risk Score | Churn Rate |
| ---------: | ---------: |
|          0 |      2.13% |
|          1 |      7.16% |
|          2 |     17.39% |
|          3 |     29.23% |
|          4 |     49.36% |
|          5 |     72.91% |

This indicates that **risk-based customer segmentation can be useful for identifying customers requiring retention attention.**

---

## 📊 Power BI Dashboard

The interactive Power BI dashboard provides:

* Total Customers
* Churned Customers
* Churn Rate
* Monthly Revenue
* Average Monthly Charges
* Churn by Contract
* Churn by Internet Service
* Churn by Payment Method
* Churn by Technical Support
* Churn by Risk Category
* Risk Score & Contract Churn Analysis
* Interactive Churn filtering


## 💡 Key Business Insights

1. **Month-to-month contracts are the highest-risk contract segment**, with a 42.71% churn rate.
2. **Fiber-optic customers have elevated churn**, with a 41.89% churn rate.
3. Customers with **higher risk scores show dramatically higher churn rates**.
4. Customers without technical support have a higher churn rate than customers receiving technical support.
5. Long-term contracts are associated with substantially lower churn.

---

## 🎯 Business Recommendations

Based on the analysis, the telecom company should:

* Target high-risk month-to-month customers with retention campaigns.
* Encourage month-to-month customers to move toward one-year or two-year contracts.
* Investigate service quality and pricing concerns among fiber-optic customers.
* Provide targeted support to customers showing high churn risk.
* Use risk scoring to prioritize retention efforts instead of treating every customer equally.
* Develop personalized offers for customers with a high probability of churn.

---

## 📁 Project Structure

```text
Telco-Customer-Churn-Analysis/
│
├── Data/
│   └── telco_churn_powerbi.csv
│
├── Excel/
│   └── Telco_Churn_Analysis.xlsx
│
├── SQL/
│   └── churn_analysis.sql
│
├── Python/
│   └── churn_analysis.ipynb
│
├── PowerBI/
│   └── Telco_Churn_Dashboard.pbix
│
├── Dashboard/
│   └── dashboard_screenshot.png
│
└── README.md
```

---

## 👩‍💻 Skills Demonstrated

**Data Analysis:**
Data Cleaning • EDA • Data Validation • Customer Segmentation • KPI Analysis

**Technical Skills:**
Excel • SQL • Python • Pandas • Power BI • DAX • Statistics • Machine Learning

**Business Skills:**
Churn Analysis • Risk Segmentation • Retention Strategy • Data-Driven Decision Making

---

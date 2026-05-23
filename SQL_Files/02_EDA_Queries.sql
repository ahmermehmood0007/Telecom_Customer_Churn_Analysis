
					-- TELECOM CUSTOMER CHURN PROJECT
					-- FILE: 02_EDA_Queries.sql
					-- PURPOSE:
					-- Exploratory Data Analysis (EDA)
					-- KPI Analysis + Customer Insights + Business Insights



-- =========================================================
-- SECTION 1 — BASIC KPIs
-- =========================================================



-- Q1
-- Show total customers

SELECT COUNT(customerID) AS total_customers

FROM telecom_customer;



-- Q2
-- Show total churned customers
-- Condition: Churn = 'Yes'

SELECT COUNT(customerID) AS total_churned_customers

FROM telecom_customer

WHERE Churn = 'Yes';



-- Q3
-- Calculate churn percentage
-- Formula:
-- (churned customers / total customers) * 100

SELECT 
(
    COUNT(CASE WHEN Churn = 'Yes' THEN 1 END) * 100.0
    / COUNT(*)
) AS churn_percentage

FROM telecom_customer;



-- Q4
-- Show total customers by gender

SELECT gender,
       COUNT(customerID) AS total_customers

FROM telecom_customer

GROUP BY gender;



-- Q5
-- Show total customers by contract type

SELECT Contract,
       COUNT(customerID) AS total_customers

FROM telecom_customer

GROUP BY Contract;



-- =========================================================
-- SECTION 2 — CUSTOMER BEHAVIOR
-- =========================================================



-- 
-- Q6
-- Show average monthly charges by churn

SELECT Churn,
       AVG(MonthlyCharges) AS average_monthly_charges

FROM telecom_customer

GROUP BY Churn;



-- Q7
-- Show average total charges by churn

SELECT Churn,
       AVG(TotalCharges) AS average_total_charges

FROM telecom_customer

GROUP BY Churn;



-- 
-- Q8
-- Show average tenure by churn

SELECT Churn,
       AVG(tenure) AS average_tenure

FROM telecom_customer

GROUP BY Churn;



-- =========================================================
-- SECTION 3 — BUSINESS INSIGHTS
-- =========================================================



-- Q9
-- Show payment methods used by most customers
-- Sort highest to lowest

SELECT PaymentMethod,
       COUNT(customerID) AS total_customers

FROM telecom_customer

GROUP BY PaymentMethod

ORDER BY total_customers DESC;



-- 
-- Q10
-- Show churn count by payment method

SELECT PaymentMethod,
       COUNT(CASE WHEN Churn = 'Yes' THEN 1 END) AS churn_count

FROM telecom_customer

GROUP BY PaymentMethod;



-- Q11
-- Show churn count by contract type

SELECT Contract,
       COUNT(CASE WHEN Churn = 'Yes' THEN 1 END) AS churn_count

FROM telecom_customer

GROUP BY Contract;



-- Q12
-- Show internet service type wise customer count

SELECT InternetService,
       COUNT(customerID) AS total_customers

FROM telecom_customer

GROUP BY InternetService;



-- =========================================================
-- SECTION 4 — HIGH VALUE CUSTOMERS
-- =========================================================


-- Q13
-- Show top 10 customers with highest TotalCharges

SELECT customerID,
       TotalCharges

FROM telecom_customer

ORDER BY TotalCharges DESC

LIMIT 10;



-- Q14
-- Show customers whose MonthlyCharges are above average

SELECT customerID,
       MonthlyCharges

FROM telecom_customer

WHERE MonthlyCharges >

(
    SELECT AVG(MonthlyCharges)
    FROM telecom_customer
);



-- =========================================================
-- SECTION 5 — SENIOR CITIZEN ANALYSIS
-- =========================================================

-- Q15
-- Show total senior citizens

SELECT COUNT(*) AS total_senior_citizens

FROM telecom_customer

WHERE seniorcitizen = 1;

-- Q16
-- Show churn count among senior citizens

SELECT Churn,
       COUNT(*) AS total_senior_citizens

FROM telecom_customer

WHERE seniorcitizen = 1

GROUP BY Churn;
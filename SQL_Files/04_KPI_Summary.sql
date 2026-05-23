
-- Q1 Total Customers
SELECT COUNT(customerid) AS total_customers
FROM telecom_customer;

-- Q2 Total Churned Customers
SELECT COUNT(CASE WHEN churn='Yes' THEN 1 END) AS total_churn_customers
FROM telecom_customer;

-- Q3 Churn Percentage
SELECT COUNT(CASE WHEN churn='Yes' THEN 1 END)*100/COUNT(*) AS total_churn_customers_percentage
FROM telecom_customer;



-- Q4 Total Revenue

SELECT SUM(totalcharges) AS total_revenue FROM telecom_customer;

-- Q5 Revenue Lost From Churned Customers
SELECT SUM(totalcharges) AS total_revenuelost
FROM telecom_customer
WHERE churn='Yes';

-- Q6 Average Monthly Charges
SELECT AVG(monthlycharges) AS avg_monthly_charges
FROM telecom_customer;



-- Q7 Average Tenure
SELECT AVG(tenure) AS average_tenure
FROM telecom_customer;

-- Q8 Most Risky Contract Type

SELECT contract,
(
    COUNT(
        CASE
            WHEN churn = 'Yes' THEN 1
        END
    ) * 100.0 / COUNT(*)
) AS churn_percentage
FROM telecom_customer
GROUP BY contract
ORDER BY churn_percentage DESC
LIMIT 1;
-- Q9
-- Most Risky Payment Method
SELECT paymentmethod,(COUNT( CASE WHEN churn = 'Yes' THEN 1 END ) * 100.0 / COUNT(*) )
AS churn_percentage
FROM telecom_customer
GROUP BY paymentmethod
ORDER BY churn_percentage DESC
LIMIT 1;


-- Q10
-- Highest Revenue Generating Contract Type
SELECT contract, SUM(totalcharges) AS highest_revenue
FROM telecom_customer
GROUP BY contract
ORDER BY highest_revenue DESC
LIMIT 1;


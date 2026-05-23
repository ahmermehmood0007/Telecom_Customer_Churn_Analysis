
				
						-- TELECOM CUSTOMER CHURN PROJECT
						-- FILE: 01_Data_Cleaning.sql
						-- PURPOSE:
						-- Data inspection + cleaning + validation


-- CREATE TABLE
CREATE TABLE telecom_customer (
    customerID VARCHAR(70),
    gender VARCHAR(20),
    seniorcitizen INT,
    partner VARCHAR(50),
    dependents VARCHAR(50),
    tenure INT,
    phoneservice VARCHAR(50),
    multiplelines VARCHAR(50),
    internetservice VARCHAR(50),
    onlinesecurity VARCHAR(50),
    onlinebackup VARCHAR(50),
    deviceprotection VARCHAR(50),
    techsupport VARCHAR(50),
    streamingTV VARCHAR(50),
    StreamingMovies VARCHAR(50),
    Contract VARCHAR(50),
    PaperLessBilling VARCHAR(50),
    PaymentMethod VARCHAR(50),
    MonthlyCharges DECIMAL(10,2),
    TotalCharges VARCHAR(50),
    Churn VARCHAR(10)

);

-- PREVIEW DATA
-- Check first 100 rows after CSV import

SELECT *
FROM telecom_customer
LIMIT 100;

-- TOTAL RECORD COUNT


SELECT COUNT(*)
FROM telecom_customer;


-- SELECT customerID,          -- THIS PART doensot execute becuase
                               -- now totatcharges become numeric
							   -- datatype and trim doesnot work upon it 
							   -- trim worK only on text/varchar.
--        tenure,
--        TotalCharges
-- FROM telecom_customer
-- WHERE TRIM(totalcharges) = '';


-- CHECK DUPLICATE CUSTOMER IDs
-- No duplicates found

SELECT customerID,
       COUNT(*)

FROM telecom_customer

GROUP BY customerID

HAVING COUNT(*) > 1;


-- CHECK DISTINCT VALUES
-- Used to identify inconsistent categories

SELECT DISTINCT Contract
FROM telecom_customer;

SELECT DISTINCT PaymentMethod
FROM telecom_customer;
SELECT DISTINCT InternetService
FROM telecom_customer;
SELECT DISTINCT Churn
FROM telecom_customer;


-- VERIFY NULL VALUES


SELECT *
FROM telecom_customer
WHERE TotalCharges IS NULL;

-- CHANGE DATATYPE
-- Convert TotalCharges from VARCHAR to DECIMAL


ALTER TABLE telecom_customer
ALTER COLUMN TotalCharges
TYPE DECIMAL(10,2)
USING TotalCharges::DECIMAL(10,2);

-- CHECK FOR NEGATIVE VALUES

SELECT *
FROM telecom_customer
WHERE MonthlyCharges < 0
OR TotalCharges < 0;

-- CHECK MONTHLY CHARGES STATISTICS

SELECT MIN(MonthlyCharges) AS minimum_monthly_charge,
       MAX(MonthlyCharges) AS maximum_monthly_charge,
       AVG(MonthlyCharges) AS average_monthly_charge
FROM telecom_customer;

-- CHECK TENURE RANGE
-- 

SELECT MIN(tenure) AS minimum_tenure,
       MAX(tenure) AS maximum_tenure
FROM telecom_customer;

-- VERIFY TOTAL NULL VALUES

SELECT COUNT(*) AS total_null_totalcharges
FROM telecom_customer
WHERE TotalCharges IS NULL;

-- DISPLAY ROWS WITH NULL TotalCharges

SELECT customerID,
       TotalCharges
FROM telecom_customer
WHERE TotalCharges IS NULL;
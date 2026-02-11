-- Healthcare SQL Portfolio Queries (SQLite)

-- Admissions by Type
SELECT Admission_Type, COUNT(*) AS cnt
        FROM healthcare
        GROUP BY Admission_Type
        ORDER BY cnt DESC;

-- Top 10 Medical Conditions
SELECT Medical_Condition, COUNT(*) AS cnt
        FROM healthcare
        GROUP BY Medical_Condition
        ORDER BY cnt DESC
        LIMIT 10;

-- Avg Billing by Insurance
SELECT Insurance_Provider, ROUND(AVG(Billing_Amount), 2) AS avg_billing
        FROM healthcare
        GROUP BY Insurance_Provider
        ORDER BY avg_billing DESC;

-- Monthly Admissions Trend
SELECT substr(Date_of_Admission, 1, 7) AS month, COUNT(*) AS admissions
        FROM healthcare
        GROUP BY month
        ORDER BY month;

-- Avg LOS by Condition
SELECT Medical_Condition,
               ROUND(AVG(julianday(Discharge_Date) - julianday(Date_of_Admission)), 2) AS avg_los_days
        FROM healthcare
        GROUP BY Medical_Condition
        ORDER BY avg_los_days DESC;

-- Top Hospitals by Total Billing
SELECT Hospital, ROUND(SUM(Billing_Amount), 2) AS total_billing
        FROM healthcare
        GROUP BY Hospital
        ORDER BY total_billing DESC
        LIMIT 10;


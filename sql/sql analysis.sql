USE workforce_analytics;
CREATE TABLE burnout (
    Gender INT,
    Company_Type INT,
    WFH_Setup_Available INT,
    Designation INT,
    Resource_Allocation FLOAT,
    Mental_Fatigue_Score FLOAT,
    Burn_Rate FLOAT,
    Joining_Month INT,
    Burnout_Risk_Score FLOAT,
    Risk_Level VARCHAR(20)
);
SELECT * 
FROM cleaned_burnout
LIMIT 5;
SELECT COUNT(*) AS total_employees
FROM cleaned_burnout;
SELECT 
    AVG(`Burn Rate`) AS avg_burnout,
    MAX(`Burn Rate`) AS max_burnout,
    MIN(`Burn Rate`) AS min_burnout
FROM cleaned_burnout;
SELECT 
    Risk_Level,
    COUNT(*) AS employee_count
FROM cleaned_burnout
GROUP BY Risk_Level
ORDER BY employee_count DESC;
SELECT 
    Risk_Level,
    AVG(Burnout_Risk_Score) AS avg_risk_score
FROM cleaned_burnout
GROUP BY Risk_Level;

SELECT 
    Gender,
    AVG(`Burn Rate`) AS avg_burnout
FROM cleaned_burnout
GROUP BY Gender;

SELECT 
    `Company Type`,
    AVG(`Burn Rate`) AS avg_burnout
FROM cleaned_burnout
GROUP BY `Company Type`;

SELECT 
    `WFH Setup Available`,
    AVG(`Burn Rate`) AS avg_burnout
FROM cleaned_burnout
GROUP BY `WFH Setup Available`;

SELECT 
    Designation,
    AVG(`Burn Rate`) AS avg_burnout
FROM cleaned_burnout
GROUP BY Designation
ORDER BY avg_burnout DESC;
SELECT 
    `Resource Allocation`,
    AVG(`Burn Rate`) AS avg_burnout
FROM cleaned_burnout
GROUP BY `Resource Allocation`
ORDER BY `Resource Allocation`;

SELECT 
    `Mental Fatigue Score`,
    AVG(`Burn Rate`) AS avg_burnout
FROM cleaned_burnout
GROUP BY `Mental Fatigue Score`
ORDER BY `Mental Fatigue Score`;

SELECT 
    Joining_Month,
    AVG(`Burn Rate`) AS avg_burnout
FROM cleaned_burnout
GROUP BY Joining_Month
ORDER BY Joining_Month;

SELECT *
FROM cleaned_burnout
WHERE Risk_Level = 'High'
ORDER BY `Burnout_Risk_Score` DESC;

SELECT 
    Risk_Level,
    COUNT(*) AS total,
    AVG(`Burnout_Risk_Score`) AS avg_score,
    AVG(`Burn Rate`) AS avg_burnout
FROM cleaned_burnout
GROUP BY Risk_Level;

SELECT 
    Gender,
    `Company Type`,
    `WFH Setup Available`,
    AVG(`Burn Rate`) AS avg_burnout,
    AVG(`Burnout_Risk_Score`) AS avg_risk
FROM cleaned_burnout
GROUP BY Gender, `Company Type`, `WFH Setup Available`;

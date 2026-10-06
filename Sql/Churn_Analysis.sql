Create Database Churn_analysis; 
select * 
from churn_analysis;

SELECT *
FROM churn_analysis
LIMIT 10; 

show databases; 
use churn_analysis; 

show tables; 

select * 
from churn_analysis 
limit 10 ; 

select 
    count(*) as total_customers,
    Sum(case when churn = 'Yes' then 1 else 0 end ) as churned_customers,
    round(
         sum(case when churn = 'Yes' then 1 else 0 end ) * 100.0/count(*) ,2 )
         as churn_rate 
   from churn_analysis; 
   
   select 
	contract,
    count(*) as total_customers,
    Sum(case when churn = 'Yes' then 1 else 0 end ) as churned_customers,
    round(
         sum(case when churn = 'Yes' then 1 else 0 end ) * 100.0/count(*) ,2 )
         as churn_rate 
   from churn_analysis 
   group by contract 
   order by churn_rate desc;
   
   select 
	tenure_Group,
    
    Sum(case when churn = 'Yes' then 1 else 0 end ) as churned_customers,
    round(
         sum(case when churn = 'Yes' then 1 else 0 end ) * 100.0/count(*) ,2 )
         as churn_rate 
   from churn_analysis 
   group by tenure_group
   order by churn_rate desc; 
   
   SELECT
    CASE
        WHEN tenure <= 12 THEN 'New'
        WHEN tenure <= 24 THEN 'Early'
        WHEN tenure <= 48 THEN 'Established'
        ELSE 'Loyal'
    END AS tenure_group,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS churn_rate
FROM churn_analysis
GROUP BY
    CASE
        WHEN tenure <= 12 THEN 'New'
        WHEN tenure <= 24 THEN 'Early'
        WHEN tenure <= 48 THEN 'Established'
        ELSE 'Loyal'
    END
ORDER BY churn_rate DESC; 

select 
    InternetService,
    count(*) as total_customers,
    Sum(case when churn = 'Yes' then 1 else 0 end ) as churned_customers,
    round(
         sum(case when churn = 'Yes' then 1 else 0 end ) * 100.0/count(*) ,2 )
         as churn_rate 
   from churn_analysis 
   group by InternetService
   order by churn_rate desc; 
   
   select 
    InternetService,contract,
    count(*) as total_customers,
    Sum(case when churn = 'Yes' then 1 else 0 end ) as churned_customers,
    round(
         sum(case when churn = 'Yes' then 1 else 0 end ) * 100.0/count(*) ,2 )
         as churn_rate 
   from churn_analysis 
   group by InternetService,contract
   order by churn_rate desc; 
   
   SELECT
    PaymentMethod,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS churn_rate
FROM churn_analysis
GROUP BY PaymentMethod
ORDER BY churn_rate DESC; 

SELECT
    CASE
        WHEN MonthlyCharges < 30 THEN 'Low'
        WHEN MonthlyCharges < 60 THEN 'Medium'
        WHEN MonthlyCharges < 90 THEN 'High'
        ELSE 'Very High'
    END AS monthly_charge_group,

    COUNT(*) AS total_customers,

    SUM(
        CASE
            WHEN Churn = 'Yes' THEN 1
            ELSE 0
        END
    ) AS churned_customers,

    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS churn_rate

FROM churn_analysis

GROUP BY
    CASE
        WHEN MonthlyCharges < 30 THEN 'Low'
        WHEN MonthlyCharges < 60 THEN 'Medium'
        WHEN MonthlyCharges < 90 THEN 'High'
        ELSE 'Very High'
    END

ORDER BY churn_rate DESC; 

SELECT
    customerID,
    Contract,
    tenure,
    InternetService,
    TechSupport,
    OnlineSecurity,
    Churn,

    (
        CASE WHEN Contract = 'Month-to-month' THEN 1 ELSE 0 END
        +
        CASE WHEN tenure <= 12 THEN 1 ELSE 0 END
        +
        CASE WHEN InternetService = 'Fiber optic' THEN 1 ELSE 0 END
        +
        CASE WHEN TechSupport = 'No' THEN 1 ELSE 0 END
        +
        CASE WHEN OnlineSecurity = 'No' THEN 1 ELSE 0 END
    ) AS risk_score

FROM churn_analysis 

 SELECT 
    risk score,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS churn_rate
FROM
(
    SELECT
        Churn,
        (
            CASE WHEN Contract = 'Month-to-month' THEN 1 ELSE 0 END
            +
            CASE WHEN tenure <= 12 THEN 1 ELSE 0 END
            +
            CASE WHEN InternetService = 'Fiber optic' THEN 1 ELSE 0 END
            +
            CASE WHEN TechSupport = 'No' THEN 1 ELSE 0 END
            +
            CASE WHEN OnlineSecurity = 'No' THEN 1 ELSE 0 END
        ) AS risk score
    FROM churn_analysis
) AS risk_data
GROUP BY risk score
ORDER BY risk score;
LIMIT 20; 

SELECT *
FROM
(
    SELECT
        customerID,
        Contract,
        tenure,
        InternetService,
        TechSupport,
        OnlineSecurity,
        MonthlyCharges,
        Churn,

        (
            CASE WHEN Contract = 'Month-to-month' THEN 1 ELSE 0 END
            +
            CASE WHEN tenure <= 12 THEN 1 ELSE 0 END
            +
            CASE WHEN InternetService = 'Fiber optic' THEN 1 ELSE 0 END
            +
            CASE WHEN TechSupport = 'No' THEN 1 ELSE 0 END
            +
            CASE WHEN OnlineSecurity = 'No' THEN 1 ELSE 0 END
        ) AS risk_score

    FROM churn_analysis
) AS customers

WHERE Churn = 'No'
AND Contract = 'Month-to-month'
AND MonthlyCharges >= 60
AND risk_score >= 4

ORDER BY risk_score DESC, MonthlyCharges DESC; 

SELECT
    COUNT(*) AS churned_customers,
    ROUND(SUM(MonthlyCharges), 2) AS lost_monthly_revenue,
    ROUND(AVG(MonthlyCharges), 2) AS avg_monthly_charge
FROM churn_analysis
WHERE Churn = 'Yes'; 

SELECT
    Contract,
    COUNT(*) AS churned_customers,
    ROUND(SUM(MonthlyCharges), 2) AS lost_monthly_revenue,
    ROUND(AVG(MonthlyCharges), 2) AS avg_monthly_charge
FROM churn_analysis
WHERE Churn = 'Yes'
GROUP BY Contract
ORDER BY lost_monthly_revenue DESC; 

SELECT
    InternetService,
    COUNT(*) AS churned_customers,
    ROUND(SUM(MonthlyCharges), 2) AS lost_monthly_revenue,
    ROUND(AVG(MonthlyCharges), 2) AS avg_monthly_charge
FROM churn_analysis
WHERE Churn = 'Yes'
GROUP BY InternetService
ORDER BY lost_monthly_revenue DESC; 

SELECT 
    Churn,
    COUNT(*) AS total_customers,
    ROUND(AVG(tenure), 2) AS avg_tenure,
    ROUND(AVG(MonthlyCharges), 2) AS avg_monthly_charge,
    ROUND(AVG(MonthlyCharges * tenure), 2) AS avg_estimated_lifetime_revenue
FROM
    churn_analysis
GROUP BY Churn;  

SELECT *
FROM
(
    SELECT
        customerID,
        Contract,
        tenure,
        InternetService,
        MonthlyCharges,
        Churn,
        (
            CASE WHEN Contract = 'Month-to-month' THEN 1 ELSE 0 END
            +
            CASE WHEN tenure <= 12 THEN 1 ELSE 0 END
            +
            CASE WHEN InternetService = 'Fiber optic' THEN 1 ELSE 0 END
            +
            CASE WHEN TechSupport = 'No' THEN 1 ELSE 0 END
            +
            CASE WHEN OnlineSecurity = 'No' THEN 1 ELSE 0 END
        ) AS risk_score
    FROM churn_analysis
) AS customers
WHERE Churn = 'No'
AND MonthlyCharges >= 90
AND risk_score >= 4
ORDER BY MonthlyCharges DESC; 

SELECT
    customerID,
    Contract,
    tenure,
    InternetService,
    MonthlyCharges,
    Churn,
    RANK() OVER (ORDER BY MonthlyCharges DESC) AS revenue_rank
FROM churn_analysis
ORDER BY revenue_rank
LIMIT 20; 

SELECT
    customerID,
    Contract,
    tenure,
    InternetService,
    MonthlyCharges,
    Churn
FROM churn_analysis
ORDER BY MonthlyCharges DESC
LIMIT 20; 

SELECT
    Contract,
    COUNT(*) AS total_customers,
    ROUND(SUM(MonthlyCharges), 2) AS total_monthly_revenue,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN MonthlyCharges ELSE 0 END),
        2
    ) AS churned_monthly_revenue
FROM churn_analysis
GROUP BY Contract
ORDER BY total_monthly_revenue DESC; 

SELECT
    Contract,
    PaymentMethod,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS churn_rate
FROM churn_analysis
GROUP BY Contract, PaymentMethod
ORDER BY churn_rate DESC; 

SELECT
    Contract,
    CASE
        WHEN tenure <= 12 THEN 'New'
        WHEN tenure <= 24 THEN 'Early'
        WHEN tenure <= 48 THEN 'Established'
        ELSE 'Loyal'
    END AS tenure_group,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS churn_rate
FROM churn_analysis
GROUP BY
    Contract,
    CASE
        WHEN tenure <= 12 THEN 'New'
        WHEN tenure <= 24 THEN 'Early'
        WHEN tenure <= 48 THEN 'Established'
        ELSE 'Loyal'
    END
ORDER BY churn_rate DESC; 

SELECT
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS churn_rate,
    ROUND(AVG(MonthlyCharges), 2) AS avg_monthly_charge
FROM churn_analysis
WHERE Contract = 'Month-to-month'
AND tenure <= 12
AND InternetService = 'Fiber optic'
AND TechSupport = 'No'
AND OnlineSecurity = 'No'; 

SELECT
    Contract,
    InternetService,
    COUNT(*) AS churned_customers,
    ROUND(SUM(MonthlyCharges), 2) AS monthly_revenue_at_risk,
    ROUND(AVG(MonthlyCharges), 2) AS avg_monthly_charge
FROM churn_analysis
WHERE Churn = 'Yes'
GROUP BY Contract, InternetService
ORDER BY monthly_revenue_at_risk DESC; 

SELECT
    CASE
        WHEN tenure <= 12 THEN 'New'
        WHEN tenure <= 24 THEN 'Early'
        WHEN tenure <= 48 THEN 'Established'
        ELSE 'Loyal'
    END AS tenure_group,
    Contract,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS churn_rate,
    ROUND(SUM(MonthlyCharges), 2) AS total_monthly_revenue
FROM churn_analysis
GROUP BY
    CASE
        WHEN tenure <= 12 THEN 'New'
        WHEN tenure <= 24 THEN 'Early'
        WHEN tenure <= 48 THEN 'Established'
        ELSE 'Loyal'
    END,
    Contract
ORDER BY churn_rate DESC; 

SELECT
    COUNT(*) AS total_customers,

    SUM(CASE
        WHEN Churn = 'Yes' THEN 1
        ELSE 0
    END) AS churned_customers,

    ROUND(
        SUM(CASE
            WHEN Churn = 'Yes' THEN 1
            ELSE 0
        END) * 100.0 / COUNT(*),
        2
    ) AS overall_churn_rate,

    ROUND(SUM(MonthlyCharges), 2) AS total_monthly_revenue,

    ROUND(
        SUM(CASE
            WHEN Churn = 'Yes' THEN MonthlyCharges
            ELSE 0
        END),
        2
    ) AS monthly_revenue_at_risk

FROM churn_analysis;
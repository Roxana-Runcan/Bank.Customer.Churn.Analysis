#clone original raw data for safe processing and transformation
CREATE TABLE IF NOT EXISTS bank_supplement LIKE bank_supplement_raw;
INSERT INTO bank_supplement
SELECT * FROM bank_supplement_raw;

CREATE TABLE IF NOT EXISTS  bank_data LIKE bank_data_raw;
INSERT INTO bank_data
SELECT * FROM bank_data_raw;

DESCRIBE bank_data;
DESCRIBE bank_supplement;

#inspect available data
SELECT * FROM bank_data;
SELECT * FROM bank_supplement;

#standardizing multiple column names in table 'bank_data'
ALTER TABLE bank_data 
RENAME COLUMN CustomerId TO customer_id;

ALTER TABLE bank_data 
RENAME COLUMN Surname TO surname;

ALTER TABLE bank_data 
RENAME COLUMN CreditScore TO credit_score;

ALTER TABLE bank_data 
RENAME COLUMN Geography TO geography_region;

ALTER TABLE bank_data 
RENAME COLUMN Gender TO gender;

ALTER TABLE bank_data 
RENAME COLUMN Age TO age;

ALTER TABLE bank_data
RENAME COLUMN Tenure TO tenure;

ALTER TABLE bank_data 
RENAME COLUMN Balance TO balance;

ALTER TABLE bank_data 
RENAME COLUMN NumOfProducts TO nr_of_products;

ALTER TABLE bank_data 
RENAME COLUMN HasCrCard TO credit_card;

ALTER TABLE bank_data 
RENAME COLUMN IsActiveMember TO active_member;

ALTER TABLE bank_data 
RENAME COLUMN EstimatedSalary TO estimated_salary;

ALTER TABLE bank_data 
RENAME COLUMN MyUnknownColumn TO exited;


#standardazing multiple column names in table 'bank_supplement'
ALTER TABLE bank_supplement
RENAME COLUMN CustomerId TO customer_id;

ALTER TABLE bank_supplement
RENAME COLUMN AccountType TO account_type;

ALTER TABLE bank_supplement
RENAME COLUMN RegionCode TO code_region;

ALTER TABLE bank_supplement
RENAME COLUMN LoyaltyScore TO loyalty_score;

ALTER TABLE bank_supplement
RENAME COLUMN MarketingOptIn TO marketing_channel;

ALTER TABLE bank_supplement
RENAME COLUMN JoinDate TO join_date;

#standardizing text values in 'gender' column in 'bank_data' table
SELECT 
	gender ,
    count(*)
FROM bank_data
GROUP BY gender;


UPDATE bank_data 
SET gender = 
	CASE 
		WHEN LOWER(TRIM(gender)) = 'male' THEN 'Male'
		WHEN LOWER(TRIM(gender)) = 'female' THEN 'Female'
		WHEN gender = '' OR gender IS NULL THEN NULL
		END;
  
  
SELECT 
	gender ,
	count(*)
FROM bank_data 
GROUP BY gender;

#standardizing text values in 'age' column in 'bank_data' table
SELECT 
	age, 
    COUNT(*)
FROM bank_data
WHERE age<0
	OR age =0
GROUP BY age ;
	
UPDATE bank_data 
SET age = 
	CASE 
		WHEN age < 0 THEN NULL ELSE age END;

#standardizing text values in 'geography_region' column in 'bank_data' table
SELECT 
	geography_region, 
    COUNT(*)
FROM bank_data
GROUP BY geography_region;

UPDATE bank_data 
SET geography_region = 
	CASE 
		WHEN geography_region='' OR geography_region IS NULL THEN NULL
        WHEN geography_region <> TRIM(geography_region) THEN TRIM(geography_region) 
        ELSE geography_region 
        END;

#updating table 'bank_data' for key metric 'tenure'
UPDATE bank_data 
SET tenure = NULL 
WHERE tenure <0;

UPDATE bank_data 
SET estimated_salary  = NULL 
WHERE estimated_salary= '';


#identification of NULL values in key columns of table 'bank_data'
SELECT
	SUM(CASE WHEN customer_id IS NULL OR TRIM(customer_id) = '' THEN 1 ELSE 0 END) AS id_null,
    SUM(CASE WHEN surname IS NULL OR TRIM(Surname) = '' THEN 1 ELSE 0 END) AS surname_null,
	SUM(CASE WHEN credit_score IS NULL OR TRIM(credit_score) = '' THEN 1 ELSE 0 END) AS score_null,
    SUM(CASE WHEN estimated_salary IS NULL THEN 1 ELSE 0 END) AS salary_null,
    SUM(CASE WHEN tenure IS NULL OR tenure < 0 THEN 1 ELSE 0 END) AS tenure_null,
    SUM(CASE WHEN geography_region IS NULL THEN 1 ELSE 0 END) AS geography_null,
    SUM(CASE WHEN gender IS NULL  THEN 1 ELSE 0 END) AS gender_null,
    SUM(CASE WHEN age IS NULL THEN 1 ELSE 0 END) AS age_null,
    SUM(CASE WHEN tenure IS NULL THEN 1 ELSE 0 END) AS tenure_null,
    SUM(CASE WHEN balance IS NULL THEN 1 ELSE 0 END) AS balance_null
FROM bank_data;
#missing or null values are rare relative to dataset size, determined as low-impact and left in the dataset


#duplicates identification in 'customer_id' field in 'bank_data' table
SELECT 
	customer_id, 
    COUNT(*)
FROM bank_data 
GROUP BY customer_id
HAVING COUNT(*) > 1;


#removing duplicates in 'customer_id' field in 'bank_data' table
WITH rank_num AS ( 
	SELECT *,
		ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY customer_id ) as dubs
	FROM bank_data 
   )
SELECT * 
FROM rank_num
WHERE dubs >1;


WITH rank_num AS ( 
	SELECT  *,
		ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY customer_id ) as dubs
	FROM bank_data 
   )
DELETE FROM bank_data
WHERE customer_id IN (
	SELECT customer_id
	FROM rank_num
	WHERE dubs >1);

# cleaning non-sensical data in 'customer_id' column in 'bank_data' table
SELECT 
	customer_id, 
    count(*)
FROM bank_data 
WHERE customer_id <0
GROUP BY customer_id;

UPDATE bank_data 
SET customer_id = NULL
WHERE customer_id <0;

Select * 
FROM bank_data;

SHOW tables;
DESCRIBE bank_data;

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'bank_data';

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name= 'supplement'; 

#conversion of 'join_date' column in 'bank_data' table from text to date 

SELECT join_date, 
	count(*)
FROM bank_supplement
GROUP BY join_date;

SELECT CAST(join_date AS date)
FROM bank_supplement;

ALTER TABLE bank_supplement
MODIFY join_date DATE;

DESCRIBE bank_supplement;


#EDA 
#sanity checks : count of churned vs retained customers and their percentages in 'bank_data' table
SELECT* FROM bank_data;
SELECT 
	COUNT(*) AS total, 
    SUM(CASE WHEN exited = 1 THEN 1 ELSE 0 END) AS churned_customers,
    SUM(CASE WHEN exited = 0 THEN 1 ELSE 0 END) AS retained_customers,
    ROUND(100* SUM(CASE WHEN exited = 1 THEN 1 ELSE 0 END) / COUNT(*),2) AS pct_churned,
    ROUND(100* SUM(CASE WHEN exited = 0 THEN 1 ELSE 0 END) / COUNT(*),2) AS pct_retained
FROM bank_data;#retained customers 6263 vs churned 1608 /79.57% vs 20.43% 



#distribution of customers by geography 
SELECT 
	geography_region,
	COUNT(*) AS total_customers, 
    ROUND(100* COUNT(*)/(SELECT COUNT(*) FROM bank_data),2)AS pct_from_region
FROM bank_data 
WHERE geography_region IS NOT NULL
GROUP BY geography_region
ORDER BY pct_from_region DESC;# customers rates by region: France 48,99% ; Germany 24.51% ; Spain 24.00%


#churning rates by geography 
SELECT 
	geography_region,
	COUNT(*) AS total,
    SUM(CASE WHEN exited =1 THEN 1 ELSE 0 END) AS churned_customers, 
    ROUND(100 * SUM(CASE WHEN exited =1 THEN 1 ELSE 0 END) / COUNT(*),2) pct_churned
FROM bank_data 
WHERE geography_region IS NOT NULL
GROUP BY geography_region 
ORDER BY pct_churned DESC;/*Germany leads at 31.36% of the total churned customers  in this region,
							followed by Spain 17.20% and France 16.34% */



#distribution of total customers by gender
SELECT 
	gender,
	COUNT(*) AS total, 
    ROUND(100*COUNT(*) / (SELECT COUNT(*) FROM bank_data),2) AS percentage
FROM bank_data
WHERE gender IS NOT NULL
GROUP BY gender
ORDER BY  percentage DESC;/*men represent the majority at 53.56% followed by women with 44.01%;
							the difference is represented by NULL values*/


#churning rates by gender
SELECT 
	gender, 
    COUNT(*) AS total,
    SUM(CASE WHEN exited = 1 THEN 1 ELSE 0 END) AS churned_customers,
    ROUND( 100*SUM(CASE WHEN exited = 1 THEN 1 ELSE 0 END)/ COUNT(*),2) AS pct_churned
FROM bank_data 
WHERE gender IS NOT NULL
GROUP BY gender
ORDER BY pct_churned DESC;# females churn at higher rates 25% vs men at 16.67 


#churn rate by geography and gender
SELECT 
	gender, 
    geography_region, 
    COUNT(*) AS total, 
    SUM(CASE WHEN exited = 1 THEN 1 ELSE 0 END) AS churned_customer, 
    ROUND(100*(SUM(CASE WHEN exited = 1 THEN 1 ELSE 0 END)) / COUNT(*),2) AS pct_churned,
    ROUND(100*(SUM(CASE WHEN exited = 1 THEN 1 ELSE 0 END)) / COUNT(*),2) - (SELECT SUM(CASE WHEN exited = 1 THEN 1 ELSE 0 END) FROM bank_data WHERE gender='Female') as difference 
FROM bank_data
WHERE 
	(gender IS NOT NULL )
	AND 
    (geography_region IS NOT NULL)
GROUP BY gender, geography_region
ORDER BY pct_churned DESC,gender;/*females lead in all regions as the most churning segment;
									biggest point difference btw genders found in Germany and Spain at ~9% */



#identifying churn rates by credit score band in 'bank_data' table
SELECT credit_score , 
	COUNT(*)
FROM bank_data 
WHERE credit_score <0
GROUP BY credit_score
ORDER BY credit_score ;#negative values identified in column 'credit_score'

UPDATE  bank_data 
SET credit_score = NULL
WHERE credit_score< 0;#35 rows affected 

SELECT COUNT(*), 
	credit_score 
FROM bank_data 
GROUP BY credit_score 
ORDER BY credit_score DESC;
#potential non-sensical data identified,namely 'credit_score' that go past 1000

SELECT COUNT(*) 
FROM bank_data 
WHERE credit_score >=1000;#39 records,defined as low impact; determined as low impact and left in the dataset


#churning rates by credit score 
SELECT 
	 CASE 
        WHEN credit_score < 350 THEN '<350'
        WHEN credit_score BETWEEN 350 AND 499 THEN "350-500"
        WHEN credit_score BETWEEN 500 AND 599 THEN "500-600"
        WHEN credit_score BETWEEN 600 AND 699 then "600-700"
		WHEN credit_score BETWEEN 700 AND 799 then "700-800"
        ELSE '800+'
		END AS credit_band,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN exited = 1 THEN 1 ELSE 0 END) AS churned,
    ROUND(100.0 * SUM(CASE WHEN exited = 1 THEN 1 ELSE 0 END) / COUNT(*), 2) AS churn_rate_pct
FROM bank_data
WHERE credit_score <1000#credit scores in Europe do not go past this level,but no way to verify, since no one source of truth 	exists and labelling systems differ across Countries
GROUP BY credit_band
ORDER BY churn_rate_pct DESC;#the biggest churners are customers with credit scores btw 350-600 relative to sample size 


#churning rates by age in 'bank_data' table
SELECT 
    CASE 
        WHEN Age < 30 THEN '<30'
        WHEN Age BETWEEN 30 AND 40 THEN '30-39'
        WHEN Age BETWEEN 40 AND 50 THEN '40-49'
        WHEN Age BETWEEN 50 AND 60 THEN '50-59'
		WHEN Age BETWEEN 60 AND 70 THEN '60-69'
        ELSE '70+'
    END AS age_band,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN exited = 1 THEN 1 ELSE 0 END) AS churned,
    ROUND(100.0 * SUM(CASE WHEN exited = 1 THEN 1 ELSE 0 END) / COUNT(*), 2) AS churn_rate_pct
FROM bank_data
GROUP BY age_band
ORDER BY churn_rate_pct DESC;#age groups btw 40-59 churn at higher rates than other age groups


#joining the tables 'bank_data' and 'bank_supplemnt' to initiate EDA 
SELECT * 
FROM bank_data AS d
LEFT JOIN bank_supplement AS s
	ON d.customer_id= s.customer_id;
    
#inconsistencies in column 'surname' identified and resolved
SELECT surname 
FROM bank_data 
WHERE surname <> TRIM(SURNAME)
	OR surname REGEXP '[^a-zA-Z'' -]';

UPDATE bank_data 
SET surname = TRIM(REGEXP_REPLACE(surname, '[^a-zA_Z'' -]','Unknown')) 
WHERE surname REGEXP '[^a-zA_Z'' -]';

UPDATE bank_data 
SET surname = CASE WHEN surname <> TRIM(surname) THEN TRIM(surname) ELSE surname END; 
   
   

#churn rate by column 'account_type' in joint table 
SELECT 
	s.account_type,
	COUNT(*) AS total, 
    SUM(CASE WHEN exited= 1 THEN 1 ELSE 0 END) AS churned, 
    ROUND(100* SUM(CASE WHEN exited= 1 THEN 1 ELSE 0 END) / COUNT(*),2) AS pct_churned
FROM bank_data d
LEFT JOIN bank_supplement s
	ON d.customer_id= s.customer_id
WHERE account_type IS NOT NULL
GROUP BY s.account_type
ORDER BY  pct_churned DESC;


#churn rate by loyalty score band in joint table
SELECT 
	CASE 
		WHEN loyalty_score <30 THEN '<30'
		WHEN loyalty_score BETWEEN 30 AND 50 THEN '30-49'
		WHEN loyalty_score BETWEEN 50 AND 60 THEN '50-59'
		WHEN loyalty_score BETWEEN 60 AND 70 THEN '60-69'
		WHEN loyalty_score BETWEEN 70 AND 80 THEN '70-79'
        ELSE '80+' 
        END AS loyalty_band,
	COUNT(*) AS total ,
    SUM(CASE WHEN exited =1 THEN 1 ELSE 0 END) AS churned,
    ROUND(100* SUM(CASE WHEN exited=1 THEN 1 ELSE 0 END) /COUNT(*),2) AS pct_churned
FROM bank_data d
LEFT JOIN bank_supplement s 
	ON d.customer_id= s.customer_id 
GROUP BY loyalty_band
ORDER BY pct_churned DESC;


#churn rate by tenure 
#sanity checks btw joining date and reported tenure

SELECT 
	tenure,
    join_date,
    TIMESTAMPDIFF(YEAR,join_date,CURDATE()) AS years , 
    tenure - TIMESTAMPDIFF(YEAR,join_date,CURDATE()) as difference
FROM bank_data d
LEFT JOIN bank_supplement s 
	ON d.customer_id= s.customer_id
WHERE tenure <> TIMESTAMPDIFF(YEAR,join_date,CURDATE());##uncovered significant differences btw reported tenure and joining date ;6940 mismatches

  SELECT 
	tenure,
    join_date,
    TIMESTAMPDIFF(YEAR,join_date,CURDATE()) AS years , 
    tenure - TIMESTAMPDIFF(YEAR,join_date,CURDATE()) as difference
FROM bank_data d
LEFT JOIN bank_supplement s 
	ON d.customer_id= s.customer_id
WHERE tenure = TIMESTAMPDIFF(YEAR,join_date,CURDATE());# only  802 matches 

SELECT 100*6940/(6940+802); # mismatched rows make up 89% of the total data,therefore existing 'tenure' column is unreliable for further analysis 



#computing the actual_tenure column from join_date 
ALTER TABLE bank_data 
ADD COLUMN actual_tenure INT;

SELECT 
	join_date, 
    TIMESTAMPDIFF(YEAR, join_date, CURDATE()) AS actual_tenure 
FROM bank_data d
LEFT JOIN bank_supplement s 
	ON d.customer_id=s.customer_id;

UPDATE bank_data d
JOIN bank_supplement s
	ON d.customer_id= s.customer_id
SET d.actual_tenure = TIMESTAMPDIFF(YEAR,join_date, CURDATE());

SELECT actual_tenure FROM bank_data;


#churn rate by column 'actual_tenure' in 'bank_data' table
SELECT 
	actual_tenure, 
    COUNT(*) AS total, 
    SUM(CASE WHEN exited=1 THEN 1 ELSE 0 END) AS churned,
    ROUND(100* SUM(CASE WHEN exited=1 THEN 1 ELSE 0 END)/COUNT(*),2) AS pct_churned
FROM bank_data
WHERE actual_tenure IS NOT NULL
GROUP BY actual_tenure
ORDER BY pct_churned DESC;
#churn is slightly higher in the 1st and 3rd years, but the 1st-year group is nearly twice as large, making that estimate more reliable and suggesting retention is weakest in the first year


#percentage of 1st year churners out of the whole churners in the dataset 
SELECT 
	actual_tenure, 
    COUNT(*) AS total, 
    SUM(CASE WHEN exited=1 THEN 1 ELSE 0 END) AS churned,
    ROUND(100* SUM(CASE WHEN exited=1 THEN 1 ELSE 0 END)/COUNT(*),2) AS pct_churned,
	ROUND(
		100* SUM(CASE WHEN exited=1 THEN 1 ELSE 0 END) / 
		(SELECT SUM(CASE WHEN exited=1 THEN 1 ELSE 0 END)FROM bank_data),2
        ) AS pct_of_all_churners
FROM bank_data
WHERE 
	actual_tenure IS NOT NULL
    AND 
    actual_tenure =1
GROUP BY actual_tenure
ORDER BY pct_churned DESC; #38% of all churners have been with the company only 0-1 years


#churn rate by salary band
SELECT 
	MIN(estimated_salary) AS min_salary,
    MAX(estimated_salary) AS max_salary,
	AVG(estimated_salary) AS average_salary
FROM bank_data
WHERE
	estimated_salary  IS NOT NULL
    AND 
    estimated_salary > 0;
#non_sensical data identified 

UPDATE bank_data 
SET estimated_salary = NULL 
WHERE estimated_salary <0;

SELECT estimated_salary 
FROM bank_data 
WHERE estimated_salary IS NOT NULL
ORDER BY estimated_salary DESC ;

#establishing salary ranges in'bank_supplement' table
SELECT 
	MIN(estimated_salary) AS min_salary,
    MAX(estimated_salary) AS max_salary,
	ROUND(AVG(estimated_salary),2) AS average_salary
FROM bank_data
WHERE estimated_salary  IS NOT NULL;#potential non-sensical data identified,min salary '12'


SELECT (MAX(estimated_salary)- MIN(estimated_salary)) AS diference
FROM bank_data;#large discrepancies data issues; additional investigation required
















# Customer Retention Analysis on Bank Records
-----
[![MySQL](https://img.shields.io/badge/-MySQL-4479A1?style=flat&logo=mysql&logoColor=white)](https://www.mysql.com/)
[![Tableau](https://img.shields.io/badge/-Tableau-E97627?style=flat&logo=tableau&logoColor=white)](https://www.tableau.com/)


## Project Background 
  
   **Aline Bank***  is a subdivision of Trust Financial Group, a much larger financial institution and is among its most recently launched businesses, having operations across three major countries in Europe: Germany, France, and Spain, and is looking to optimize its operations before expanding further into the European market.

  Having built a solid customer portfolio across these countries through its digital banking services, regional expertise, and customer-focused offerings, the bank is now focused on strengthening retention and improving long-term customer value.

  The next priority is to understand which customer segments are most likely to leave and which behavioral patterns may signal churn, so the bank can design more targeted retention strategies across these markets.

  
-----



## Insights and recommendations are provided on the key areas:
-----
- [**Executive Summary**](https://github.com/Roxana-Runcan/Bank.Customer.Churn.Analysis#executive-summary)

- [**Detailed Analysis**](#detailed-analysis)
     - [Geography Segment](#geography-segment)  
     - [Gender Segment](#gender-segment)
     - [Age segment](#age-segment) 
     - [Product segment](#product-segment)
     - [Tenure segment](#tenure-segment)   
     - [Customer Trends Over Time](#customer-trends-over-time)
 

- [**Business Implications Analysis**](https://github.com/Roxana-Runcan/Bank.Customer.Churn.Analysis#business-implications-analysis)

- [**Recommendations**](#recommendations)

- [**Caveats and Assumptions**](#caveats-and-assumptions)

  




An interactive Tableau dashboard can be downloaded [here](https://public.tableau.com/app/profile/roxana.runcan/viz/CustomerChurnatBank/Dashboard)

The SQL queries with additional comments and steps taken to clean, standardize, and conduct exploratory analysis on the available dataset can be found [here](https://github.com/Roxana-Runcan/Bank.Customer.Churn.Analysis/blob/main/SQL%20Scripts/bank_data_cleaning_EDA.sql).

The files with the unprocessed data can be found [here](https://github.com/Roxana-Runcan/Bank.Customer.Churn.Analysis/tree/main/Raw%20Data%20Files).

Source: the original files used for analysis, can be found [here](https://www.kaggle.com/datasets/muhammadhamzamaher/bank-data/data), and additional comments on the source of the data, have been provided in the [Caveats and Assumptions](https://github.com/Roxana-Runcan/Bank.Customer.Churn.Analysis/blob/main/README.md#caveats-and-assumptions) section of the project.


## Data Structure and Initial Checks:
-----

The Bank Database Structure, as seen below, contains two main Tables: bank_data and bank_supplement, with a total row count of **165,053** .
<p align="center">
<img width="756" height="559" alt="Screenshot 2026-07-24 at 15 21 21" src="https://github.com/user-attachments/assets/b1743163-5377-451d-8c19-a744ed630f50" />

</p>

## Executive Summary

Germany is the main driver of churn, with substantially higher loss rates than Spain and France, while France leads in both acquisition and retention. 

Women and customers aged 40–59 are the most likely segments to churn, especially in Germany,but not only while customers under 40 years old retain generally better. 

The Basic plan dominates sales, but women show stronger interest in upgrading to Plus and Premium, and churn patterns vary by tenure across countries.




## Detailed Analysis
-----

### Geography Segment:
- France is the leading source of new customers across all three countries, accounting for 50.33% of our customer base, followed by Germany at 25.08% and lastly, Spain at 24.58%  
- Germany has the highest churn rate overall ~32 % ,leading with a 14.5 percentage points difference in front of Spain and 15.5 percentage points difference from France in customer loss
- France is the overall leader in new customer acquisition, and customer retention, achieving a 83.74% retention rate over time 

<p align="center">

<img width="750" height="350" alt="Screenshot 2026-07-26 at 16 12 08" src="https://github.com/user-attachments/assets/3dee1eed-f836-44b7-b23b-b7c47f5d461c" />
<img width="750" height="350" alt="Screenshot 2026-07-26 at 16 11 55" src="https://github.com/user-attachments/assets/073f9666-9484-43e3-a564-aa79d909b228" />

</p>



### Gender Segment:
- Women represent the highest churning segment across all countries, having the highest rate in Germany,relative to the total customer base
- Female churn is 36.6% in Germany, compared to 22.2% in Spain and 20.6% in France
- Among men, churn starts at ~28% in Germany and declines significantly in the remaining countries, staying below 14% in Spain and France
<p align='center'>

<img width="750" height="280" alt="Screenshot 2026-07-26 at 16 21 36" src="https://github.com/user-attachments/assets/2440a29b-722d-47cb-a6ba-0b3093dda789" />

</p>


 ### Age Segment:
- The highest churn is observed among members between 40 and 69 years old, with all countries indicating the highest customers loss across the 50-59 age group, and followed strongly by the 60 to 69 age group in Germany and France; in Spain the second-highest churning group is represented by the 40 to 49 year old.
- At the country-level, Germany can be observed again as the leading source of churning members with rates that reach 69% and 56% for the age groups described above. 
- Retention is strongest among members under 30, with 91% remaining with the company after joining, curiously followed closely by 70+ group and finally, the 30-39 age group with a retention rate of 89%

<p align="center">
 <img width="750" height="500" alt="Screenshot 2026-07-26 at 16 42 28" src="https://github.com/user-attachments/assets/997b9cce-a19f-45e8-999b-ffd3c26fd0f7" />
 <img width="750" height="278" alt="Screenshot 2026-07-26 at 16 42 49" src="https://github.com/user-attachments/assets/faee4c8c-4adc-467a-8f02-e97964188b2f" />


</p>

 ### Product Segment:
- The Basic plan remains the bank's best-selling product followed by Plus and Premium
- A noticeable gap in customer preference towards higher-tier products can be observed in the women segment, who are more likely to move towards Plus or Premium plans relative to the group size; the years 2023 and 2025 are especially indicative of women's preference towards these products, exception to this preference being only overtuned by men in the year of 2024 when men showed slightly higher interest in the same products

<p align="center">
<img width="750" height="500" alt="Screenshot 2026-07-26 at 16 47 28" src="https://github.com/user-attachments/assets/cfbd6a5f-a87a-4293-8ce8-393ca92f0aa7" />



</p>

 ### Tenure Segment:
- Highest churning rate in the first year of tenure remains in Germany, at 33% and decreases gradually as tenure increases, reaching ~30% by the third year
- Spain and France show a different pattern; in both countries the first year seems to be the worst performing, followed by a decrese in churn rates in the second year and a slighth spike in the third year  

<p align="center">
<img width="750" height="313" alt="Screenshot 2026-07-26 at 17 00 04" src="https://github.com/user-attachments/assets/bfe4376b-07ba-4cbb-acb0-9889c693ae0e" />

</p>

  
 ### Customer trends over time:
- New customer acquisition is strongest in the first part of the year
- Acquisition drops significantly in the second half of the year; the only exception to this rule is the year 2025, which started strong and had a significant dip in the second quarter, additional analysis is required for this year to ensure accurate evaluation,due to missing data for the remaining two quarters of the year 
- A similar pattern of increase in the first two quarters of the year can be observed in the number of churned customers,followed by a steady decrease as the year progresses
 

  
### Business Implications Analysis:
-----

- Geography Insight: Germany is the most at-risk market
  
- Gender insight: Women churn more than men across all countries, and show the largest gap in Germany
  
- Age insight: churn rates peak among 50 to 59 year old members and retention is highest with among customers under 30 
  
- Product Insight: women show a higher interest in Plus and Premium plans
  
- Tenure Insight: Germany struggles with retaining new customers , especially in the first year,while Spain and France show a different risk profile, which indicates that their highest churning rates come from customers with the longest tenure
  
- Trend over time Insight: both growth and churn are concentrated in the earlier part of the year , which suggest seasonality in customer behavior
  
  


## Recommendations:
-----

- Strengthen customer loyalty in Germany, as it has the highest churn rate and the greatest influence on overall results

- Retention campaigns should focus on female customers across all countries

- Additionally, churn reducing strategies should target first year customers in Germany, where onboarding experiences should be re-evaluated and improved, while in Spain and France loyalty incentives should be deployed to preserve the already existing customer base

- The 40–59 age segment should be prioritized for both customer retention and product expansion, as it combines high value with a high churn rate

- Build targeted upsell strategies for women who currently hold the basic product, as they show the strongest interest in moving toward Plus and Premium
  


## Caveats and Assumptions:
---
- The analysis has been conducted on 2.5 years of data. For the purpose of creating an actionable plan, it was assumed that the year 2025 will follow similar trend patterns for the remaining months. However, this assumption will require additional validation at the end of the year, and the anticipated trends may need to be re-evaluated
- The original dataset used for analysis was sourced from [Kaggle](https://www.kaggle.com/datasets/muhammadhamzamaher/bank-data/data), and to better reflect a realistic working environment, the data was processed further with AI to increase its complexibity and imperfections, while also, an additional table with synthetic data was generated.
- 'Aline Bank' represents a fictional bank used as a sample entity. 
----- 

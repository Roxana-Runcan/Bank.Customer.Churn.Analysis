# Customer Retention Analysis on Bank Records
-----
[![MySQL](https://img.shields.io/badge/-MySQL-4479A1?style=flat&logo=mysql&logoColor=white)](https://www.mysql.com/)
[![Tableau](https://img.shields.io/badge/-Tableau-E97627?style=flat&logo=tableau&logoColor=white)](https://www.tableau.com/)


## Project Background 
  
   **Aline Bank***  is a subdivision of Trust Financial Group, a much larger financial institution and is among its most recently launched businesses, having operations across three major countries in Europe: Germany, France and Spain, but looking to optimize its operations before expanding further into the European market.

  Having built a solid customer portfolio across these countries through its digital banking services, regional expertise, and customer-focused offerings, the bank is now focused on strengthening retention and improving long-term customer value.

  The next priority is to understand which customer segments are most likely to leave and which behavioral patterns may signal churn, so the bank can design more targeted retention strategies across these markets.




## Insights and recommendations are provided on the key areas:
-----
- [**Executive summary**](#executive-summary)

- [**Deep Dive Analysis**](#deep-dive-analysis)
     - [Geography](#geography)  
     - [Gender](#gender)  
     - [Age](#age)
     - [Product](#product)
     - [Tenure](#tenure)   
     - [Customer Trends Over Time](#customer-trends-over-time)
 

- [**Bussiness Implications Analysis**](#bussiness-implications-analysis)

- [**Recommendations**](#recommendations)

- [**Caveats and assumptions**](#caveats-and-assumptions)

  




An interactive Tableau dashboard can be downloaded [here](https://public.tableau.com/app/profile/roxana.runcan/viz/BankDataChurnRate/Dashboard2)

The SQL queries utilized to cleand, standardize and conduct the exploratory analysis of the dataset can be found [here](https://github.com/runcanroxana-droid/Sales-Potential-on-US-Market/blob/main/Cleaned_data_initial_EDA.sql).

The files with the unprocessed data can be found [here]( https://github.com/runcanroxana-droid/Sales-Potential-on-US-Market/tree/main/data/raw).

## Data Structure and Initial Checks:
-----

The Bank Database Structure, as seen below, contains two main Tables : bank_data and bank_supplement, with a total row count of 165.053 rows.

<img width="751" height="675" alt="Screenshot 2026-06-01 at 16 59 28" src="https://github.com/user-attachments/assets/2c34b6f5-789b-4d7e-b87c-fec3ef4becc5" />



## Executive Summary

Germany is the main driver of churn, with much higher loss rates than Spain and France, while France leads in both acquisition and retention. 

Women and customers aged 40–59 are the most likely segments to churn, especially in Germany, while customers under 40 years old retain strongly. 

The Basic plan dominates sales, but women show strong interest in upgrading to Plus and Premium, and churn patterns differ by tenure across countries.



## Deep Dive Analysis
-----

### Geography :
- Germany has the highest churn rate overall 32.0 % ,leading with a 14.5 points difference in  front of Spain and 15.5 point difference from France in customer loss
- France is the overall leader in new customer aquisition, and customer retention, achieving a 84.56% retention rate over time 


### Gender :
- Women represent the highest churning segment across all countries, having the highest rate in Germany;
- Female churn is 36.7% in Germany, compared to 22.3% in Spain and 20.6% in France
- Among men, churn starts at 28% in Germany and declines significantly in the remaining countries, staying below 14% in Spain and France


 ### Age :
- The highest churn is observed among members aged 50-59 and 40-49 ,whith churn rates at 56% 31% , respectively
- Retention is strongest among members under 30, with 92.58% remaining with the company after joining, followed closely by the 30-39 age group with a retention rate of 90.26%

<p align="center">
  <img width="600" height="500" alt="Screenshot 2026-07-19 at 16 36 36" src="https://github.com/user-attachments/assets/71a66584-d89d-4cbd-9905-0c84a4e5d4c4" />
</p>

 ### Product :
- The Basic plan remains the bank's best-selling product followed by Plus and Premium
- A noticable gap in customer preference towards higer-tier products can be observed in the women segment, who are more likely to move towards Plus or Premium plans relative to the group size

 ### Tenure :
- Highest churning rate in the first year of tenure remains in Germany, at 33% and decreases gradually as tenure increases, reaching 30.2% by the third year
- Spain and France show a different pattern; in both countries the highest churn is observed in the customers who have stayed with the company the longest, reaching 18.5% in Spain and 17.1% in France
  
 ### Customer trends over time:
- New customer acquisition is strongest in the first half of the year
- Aquisition drops significantly in the second half of the year; the only exception to this rule is the year 2025, which started weaker than previous years
- A similar pattern can be observed in churned customers count, which also changes over the course of the year
 

<p align="center">
<img width="400" height="350" alt="Screenshot 2026-07-20 at 10 52 41" src="https://github.com/user-attachments/assets/4f540a53-d63f-4a2f-85ed-72a703c8b515" />
<img width="400" height="350" alt="Screenshot 2026-07-20 at 10 52 32" src="https://github.com/user-attachments/assets/07e48210-fc0a-48bd-a94a-18e90fbe1401" />

</p>


  
### Business Implications Analysis:
-----

- Geography Insight: Germany is the most at-risk market
  
- Gender insight: Women churn more than men across all countries, and show the largest gap in Germany
  
- Age insight: churn rates peak among 50 to 59 year old members and retention is highest with under 30 customers
  
- Product Insight: women show a higher interest in Plus and Premium plans
  
- Tenure Insight: Germany struggles with retaining new customers , especially in the 1st year,while Spain and France show a different risk profile, which indicates that their highest churning rates come from customers with the longest tenure
  
- Trend over time Insight: both growth and churn are concentrated in the earlier part of the year , which suggest seasonality in customer behavior
  
  


## Recommendations
-----

- Strengthen customer loyalty in Germany, as it has the highest churn rate and the greatest influence on overall results

- Retention campaigns should focus on female customers across all countries

- Additionally, churn reducing strategies should target first year customers in Germany, where onboarding experiences should be re-evaluated and improved, while in Spain and France loyalty incentives should be deployed to preserve the already existing customer base

- The 40–59 age segment should be prioritized for both customer retention and product expansion, as it combines high value with a high churn rate

- Build targeted upsell strategies for women who currently hold the basic product, as they show the strongest interest in moving towards Plus and Premium
  


## Caveats and assumptions
---
- The analysis has been conducted on 2.5 years of data. For the purpose of creating an actionable plan, the assumption was made that the year 2025 will follow similar trend patterns for the remaining months. However, this assumption will require additional validation at the end of the year, and the anticipated trends may need to be re-evaluated
----- 


*represents a sample company

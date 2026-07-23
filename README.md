# Customer Retention Analysis on Bank Records
-----
[![MySQL](https://img.shields.io/badge/-MySQL-4479A1?style=flat&logo=mysql&logoColor=white)](https://www.mysql.com/)
<a href="https://www.tableau.com/">
  <img src="https://logo.svgcdn.com/logos/tableau.svg" alt="Tableau" width="100" />
</a>

## Project Background 


  The banking industry is well-known for its competitive environment in which it operates. An industry that allows for so much flexibility for the customer to switch between financial services creates the perfect circumstances for this level of competition to exist. Therefore,for banks to remain relevant in today's market while balancing profitability and growth, one key factor becomes apparent: **customer retention**.
  
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
     - [Customer Trends Over Time](#customer-trends-over-time)
 

- [**Bussiness Implications Analysis**](#bussiness-implications-analysis)

- [**Recommendations**](#recommendations)

- [**Caveats and assumptions**](#caveats-and-assumptions)

  




An interactive Tableau dashboard can be downloaded [here](https://public.tableau.com/app/profile/roxana.runcan/viz/BankDataChurnRate/Dashboard2)

The SQL queries utilized to cleand, standardize and conduct initial analysis of the dataset can be found [here](https://github.com/runcanroxana-droid/Sales-Potential-on-US-Market/blob/main/Cleaned_data_initial_EDA.sql).

The files with the unprocessed data can be found [here]( https://github.com/runcanroxana-droid/Sales-Potential-on-US-Market/tree/main/data/raw).

## Data Structure and Initial Checks:
-----

The US Income Database Structure, as seen below, contains two main Tables : US Household Income and US Household Income Statistics with a total row count of 65,059.

<img width="751" height="675" alt="Screenshot 2026-06-01 at 16 59 28" src="https://github.com/user-attachments/assets/2c34b6f5-789b-4d7e-b87c-fec3ef4becc5" />


## Executive Summary

Overall growth in the bank has been declining, even though the first 2 quarters have been historically the strongest periods for aquiring new customers and the last 2 quarters the slowest, this pattern seems to be changing in 2025 as the second quarter shows a strong decline. It is important to note that the data available for this year only extends until June, and the second half of the year is not yet captured which could display a momentum-change by the completion of the year.

Among the markets analyzed,Germany presents the biggest challenge, having a customer acquision rate relatively low , while churn rate is the highest out of the three countries. 


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

 ### Customer trends over time:
- New customer acquisition is strongest in the first half of the year
- Aquisition drops significantly in the second half of the year
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
- Trend over time Insight: both growth and churn are concentrated in the earlier part of the year , which suggest seasonality in customer behavior 

## Recommendations
-----

   Based on the analysis, Aurora Luxury Atelier should prioritize a phased US expansion strategy centered on affluent East Coast markets.
   The strongest commercial potential is concentrated in high-income states such as the District of Maryland, New Jersey, Connecticut, District of Columbia and Massachusetts, with additional opportunity in select high-income suburban cities. This should reduce operational complexity and improve access to high-value customer segments.
   Given the elevated logistics and infrastructure costs associated with Alaska and Hawaii these markets should be deferred until a later expansion phase.
   In the short term, the brand should focus on premium, high-income regions where purchasing power is strongest and customer acquisition efficiency is most likely to be highest.
     


## Caveats and assumptions
----- 
- Alaska and Hawaii were excluded to improve distribution efficiency and keep the analysis focused on contiguous market logistics.That said, Alaska may warrant separate review later, as higher logistics costs and geographic isolation could influence both feasibility and observed income levels.
- The income figures should be interpreted as directional market signals rather than a guarantee of demand or conversion.
   High income improves targeting potential, but product-market fit, pricing, competition, and local execution will still drive results.
   The exclusion of Alaska and Hawaii is practical for rollout planning, but it limits the completeness of the national picture.

*represents a sample company

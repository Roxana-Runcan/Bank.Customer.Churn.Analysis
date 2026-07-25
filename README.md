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
- [**Executive Summary**](#excutive-summary)

- [**Detailed Analysis**](#detailed-analysis)
     - [Geography Segment](#geography-segment)  
     - [Gender Segment](#gender-segment)
     - [Age segment](#age-segment) 
     - [Product segment](#product-segment)
     - [Tenure segment](#tenure-segment)   
     - [Customer Trends Over Time](#customer-trends-over-time)
 

- [**Business Implications Analysis**](#bussiness-implications-analysis)

- [**Recommendations**](#recommendations)

- [**Caveats and Assumptions**](#caveats-and-assumptions)

  




An interactive Tableau dashboard can be downloaded [here](https://public.tableau.com/app/profile/roxana.runcan/viz/BankDataChurnRate/Dashboard2)

The SQL queries with additional comments with steps related to the workflow, cleaning, standardizing, and the exploratory analysis conducted on the available dataset can be found [here](https://github.com/Roxana-Runcan/Bank.Customer.Churn.Analysis/tree/main/Raw%20Data%20Files).

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

The Basic plan dominates sales, but women show strong interest in upgrading to Plus and Premium, and churn patterns vary by tenure across countries.




## Detailed Analysis
-----

### Geography Segment:
- France is the leading source of new customers across all three countries, accounting for 50.25% of our customer base,  followed by Germany at 25.14% and lastly, Spain at 24.62%  
- Germany has the highest churn rate overall ~32.0 % ,leading with a 14.5 percentage points difference in front of Spain and 15.5 percentage points difference from France in customer loss
- France is the overall leader in new customer acquisition, and customer retention, achieving a 84.56% retention rate over time 

<p align="center">
<img width="660" height="502" alt="Screenshot 2026-07-24 at 13 17 20" src="https://github.com/user-attachments/assets/aecfce10-0bb1-4bf8-a7fa-ea23eda588a2" />
 
<img width="660" height="160" alt="Screenshot 2026-07-24 at 11 52 51" src="https://github.com/user-attachments/assets/2c57c4cc-967f-4c6c-a2b1-d67849edadd9" />
</p>



### Gender Segment:
- Women represent the highest churning segment across all countries, having the highest rate in Germany,relative to the total customer base
- Female churn is 36.7% in Germany, compared to 22.3% in Spain and 20.6% in France
- Among men, churn starts at 28% in Germany and declines significantly in the remaining countries, staying below 14% in Spain and France
<p align='center'>
<img width="660" height="148" alt="Screenshot 2026-07-24 at 12 30 21" src="https://github.com/user-attachments/assets/02c2d360-ae68-449b-a012-d3bb8be79b25" />
</p>


 ### Age Segment:
- The highest churn is observed among members aged 50-59 and 40-49 ,whith churn rates at 56.74%  and 30.97% , respectively
- At the country-level, Germany can be observed again as the leading source of churning members in the 50-59, 40-49 and +60 age groups
- Retention is strongest among members under 30, with 92.58% remaining with the company after joining, followed closely by the 30-39 age group with a retention rate of 90.26%

<p align="center">
  <img width="400" height="100" alt="Screenshot 2026-07-24 at 13 22 59" src="https://github.com/user-attachments/assets/f6f7597c-ca45-4056-8d29-d74ca887a9fa" />
<br><br>
  <img width="400" height="200" alt="Screenshot 2026-07-24 at 13 21 58" src="https://github.com/user-attachments/assets/68d50efa-f5e8-4038-9fe0-b9d4df4397b2" />

</p>

 ### Product Segment:
- The Basic plan remains the bank's best-selling product followed by Plus and Premium
- A noticeable gap in customer preference towards higher-tier products can be observed in the women segment, who are more likely to move towards Plus or Premium plans relative to the group size; the years 2023 and 2025 are especially indicative of women's preference towards these products, exception to this preference being only overtuned by men in the year of 2024 when men showed slightly higher interest in the same products
<div align="center">
  <table>
    <tr>
      <td valign="top" align="center">
        <img width="400" height="350" alt="Screenshot 2026-07-24 at 13 44 34" src="https://github.com/user-attachments/assets/e9441529-9996-4820-b74d-f4db7d3d7db6" />
      </td>
      <td  align="center">
        <img width="260" height="120" alt="Screenshot 2026-07-24 at 13 54 29" src="https://github.com/user-attachments/assets/e511664d-3b59-4860-88cf-e5ff3fa8a66b" />
        <br><br>
        <img width="260" height="160" alt="Screenshot 2026-07-24 at 13 45 58" src="https://github.com/user-attachments/assets/5e6963bc-a5f7-4dcc-a007-da075cd56e8a" />
      </td>
    </tr>
  </table>
</div>


 ### Tenure Segment:
- Highest churning rate in the first year of tenure remains in Germany, at 33% and decreases gradually as tenure increases, reaching 30.2% by the third year
- Spain and France show a different pattern; in both countries the highest churn is observed in the customers who have stayed with the company the longest, reaching 18.5% in Spain and 17.1% in France

<p align="center">
<img width="660" height="209" alt="Screenshot 2026-07-24 at 14 20 21" src="https://github.com/user-attachments/assets/dcda5802-4e7e-4448-84f7-eb499a934b7f" />


  
 ### Customer trends over time:
- New customer acquisition is strongest in the first part of the year
- Acquisition drops significantly in the second half of the year; the only exception to this rule is the year 2025, which started strong and had a significant dip in the second quarter, additional analysis is required for this year to ensure accurate evaluation missing data is missing for the remaining two quarters of the year 
- A similar pattern of increase in the first two quarters of the year can be observed in the number of churned customers,followed by a steady decrease as the year progresses
 

<p align="center">
<img width="660" height="500" alt="Screenshot 2026-07-24 at 14 31 42" src="https://github.com/user-attachments/assets/859d40ff-ef5b-4060-b99d-8e655e7a7f5b" />

</p>


  
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
- The original dataset used for analysis was sourced from [Kaggle](https://www.kaggle.com/datasets/muhammadhamzamaher/bank-data/data),and to better reflect a realistic working environment, the data was processed further with AI to increase its complexibity and imperfections and an additional table with synthetic data was generated.
- 'Aline Bank' represents a fictional bank used sample entity. 
----- 

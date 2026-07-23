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
     - [Income Distribution](#income-distribution)  
     - [High Income States](#high-income-states)  
     - [City-level Concentration](#city-level-concentration)  
     - [Geographic Clustering](#geographic-clustering)
     - [Risk Considerations](#risk-considerations)  


- [**Market Analysis Insights**](#market-analysis-insights)

- [**Recommendations**](#recommendations)

- [**Caveats and assumptions**](#caveats-and-assumptions)

  




An interactive Tableau dashboard can be downloaded [here]([https://public.tableau.com/app/profile/roxana.runcan/viz/DistributionOfBuyingPoweracrosstheU_S/Dashboard1](https://public.tableau.com/app/profile/roxana.runcan/viz/BankDataChurnRate/Dashboard2)).

The SQL queries utilized to cleand, standardize and conduct initial analysis of the dataset can be found [here](https://github.com/runcanroxana-droid/Sales-Potential-on-US-Market/blob/main/Cleaned_data_initial_EDA.sql).

The files with the unprocessed data can be found [here]( https://github.com/runcanroxana-droid/Sales-Potential-on-US-Market/tree/main/data/raw).

## Data Structure and Initial Checks:
-----

The US Income Database Structure, as seen below, contains two main Tables : US Household Income and US Household Income Statistics with a total row count of 65,059.

<img width="751" height="675" alt="Screenshot 2026-06-01 at 16 59 28" src="https://github.com/user-attachments/assets/2c34b6f5-789b-4d7e-b87c-fec3ef4becc5" />


## Executive Summary

Overall growth in the bank has been declining, even though the first 2 quarters have been historically the strongest periods for aquiring new customers and the last 2 quarters the slowest, this pattern seems to be changing in 2025 as the second quarter shows a strong decline.It is important to note that the data available for this year only extends until June, and the second half of the year is not yet captured which could display a momentum-change by the completion of the year.

Among the markets analyzed,Germany presents the biggest challenge, having a customer acquision rate relatively low , while churn rate is the highest out of the three countries. 


## Deep Dive Analysis
-----

### Customer behavior insight:
- The highest churn is concentrated among female customers across all countries
- The strongest retention groups are found in the 40 to 59 age groups, while at the same time  
<p align="center">
  <img width="600" height="500" alt="Screenshot 2026-07-19 at 16 36 36" src="https://github.com/user-attachments/assets/71a66584-d89d-4cbd-9905-0c84a4e5d4c4" />
</p>



### Churn Rates by Geography:
- France appears to have the highest number of churners at first glance, with 630 customers lost, however, this represents only 16.34% of its total customer base
- Germany shows a more concerning picture, with a churn rate of 31.36% relative to its customer base, indicating much weaker retention in that market
- Spain’s churn rate is 17.20%, making it closer to France in overall stability, although its acquisition rate has been the lowest of the three countries.
  
 <img width="975" height="149" alt="Screenshot 2026-07-19 at 16 44 38" src="https://github.com/user-attachments/assets/15f2d710-1365-4561-b7d6-7b56aad14c3e" />




### Churn Rates by Gender:
- Across all three countries, men make up just over half of the customer base, at around 53%
- However, females account for the highest share of churn in every market, suggesting a retention gap in this segment
- On average, women show about a 9% higher churn intensity than men, which points to a meaningful difference in customer retention by gender

<p align="center">


</p>

### Churning and Joining rates by month :
- The biggest acquisition of customers happens in the first half of the year and significantly tapers towards the end of the year, the same cicle can be observed in the leaving rate of the customers, most churning happens in the first 6 months of the year
    - This indicates that the acquisition campaigns deployed are bringing in new customers
    - But at the same time that onboarding of these new customers is not strong enough
    - after interaction with our product and testing for compatibility with the customer needs , they decide to leave

<p align="center">
<img width="400" height="350" alt="Screenshot 2026-07-20 at 10 52 41" src="https://github.com/user-attachments/assets/4f540a53-d63f-4a2f-85ed-72a703c8b515" />
<img width="400" height="350" alt="Screenshot 2026-07-20 at 10 52 32" src="https://github.com/user-attachments/assets/07e48210-fc0a-48bd-a94a-18e90fbe1401" />

</p>
### Risk Considerations:

- High-earning cities and states often show strong average income levels, but they also display higher income variability, indicating that wealth is less evenly distributed. In this dataset, only a very small number of members fall into the most stable affluent category, while the majority of high-income observations still exceed the variability threshold (set at 10.000), suggesting that many affluent markets may be less stable than their averages imply

<p align="center">
  <img width="716" height="680" alt="Wealth vs Variability" src="https://github.com/user-attachments/assets/40fd7181-8b73-4b3a-b56a-9e0539190e43" />
</p>

  <img width="28" height="27" alt="image" src="https://github.com/user-attachments/assets/7e20d45a-eb2a-4742-9a6e-a3181f8f0003" /> The light gray cluster represents lower-income but more stable markets.
  

  <img width="27" height="26" alt="image" src="https://github.com/user-attachments/assets/1da73ab4-51a1-4704-b305-fd9e78f1cd8f" /> The darker gray cluster represents all members under the 100k household income within a state or city, with uneven variability.

  <img width="27" height="27" alt="image" src="https://github.com/user-attachments/assets/379b8e53-5159-48f2-9982-fbebd3649ffe" /> The light pink cluster represents affluent but uneven markets, where income is high but standard deviation is also high.
  
  <img width="27" height="27" alt="image" src="https://github.com/user-attachments/assets/42cfcdde-296e-4e28-829b-8b9a6409341c" /> The fact that only a very small number of points sit in the “high income, low deviation” zone suggests that truly stable affluence is rare.


## Market Analysis Insights
-----

  - Key finding : East Coast dominates high-income states, closely followed by the West Coast
  - Primary recommendation: Focus on the highest-income states and affluent suburban cities
  - Expansion model: should includ a pilot phase in the top East Coast markets, followed by expansion in additional high-income states once demand is validated
  - Complex markets with potential hidden costs which have been excluded from analysis: Alaska, Hawaii
  - Low-income states: are predominantly concentrated in the South and display a low purchasing power

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

*represent a sample company

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

  




An interactive Tableau dashboard can be downloaded [here](https://public.tableau.com/app/profile/roxana.runcan/viz/DistributionOfBuyingPoweracrosstheU_S/Dashboard1).

The SQL queries utilized to cleand, standardize and conduct initial analysis of the dataset can be found [here](https://github.com/runcanroxana-droid/Sales-Potential-on-US-Market/blob/main/Cleaned_data_initial_EDA.sql).

The files with the unprocessed data can be found [here]( https://github.com/runcanroxana-droid/Sales-Potential-on-US-Market/tree/main/data/raw).

## Data Structure and Initial Checks:
-----

The US Income Database Structure, as seen below, contains two main Tables : US Household Income and US Household Income Statistics with a total row count of 65,059.

<img width="751" height="675" alt="Screenshot 2026-06-01 at 16 59 28" src="https://github.com/user-attachments/assets/2c34b6f5-789b-4d7e-b87c-fec3ef4becc5" />


## Executive Summary


The purpose of this analysis was to identify concentrations of buying power across the United States to guide market-entry strategy for a European company. The results show that the top 10 most affluent states should be the primary target, with nine located on the East Coast and one on the West Coast.

At the city level, the strongest concentration of high-earning cities is found in only five states: Connecticut, New Jersey, Maryland, California, and Massachusetts. This pattern suggests that initial expansion efforts should focus on these states, as they combine strong household purchasing power with clustered high-income urban markets.

## Deep Dive Analysis
-----

### Income Distribution:
- The income distribution appears broadly centered in the middle-income range, with a gradual increase toward a peak around 50K–70K and a slow tapering toward higher incomes. Overall, the shape is close to a normal distribution, but with a slight right skew caused by a smaller number of high-income households
<p align="center">
<img width="500" height="500" alt="Screenshot 2026-07-02 at 17 33 55" src="https://github.com/user-attachments/assets/4428591d-0ae3-41ba-8029-5d07085f200f" />
</p>


### High Income States:
- The top 10 states all exceed the national average of roughly 65k, making them the most relevant geographies for premium market targeting.
- These states form the core market for the next stage of commercial prioritization.

<p align="center">
<img width="700" height="500" alt="Screenshot 2026-07-11 at 14 21 55" src="https://github.com/user-attachments/assets/0aa2391c-e858-44f0-b8ad-97f5af0137d2" />
 />
</p>

### City-level Concentration:
- Within these 10 states, the strongest cities show average incomes starting at roughly 169k on the low end, this indicates that the opportunity is not evenly distributed across each state, but concentrated in select urban areas.

<p align="center">
<img width="700" height="486" alt="Income by City and State" src="https://github.com/user-attachments/assets/c2bcd6b4-df50-47cd-b329-f96ec8ff2c97" />
</p>

### Geographic Clustering:
- A notable clustering pattern appears on the East Coast, where 9 of the 10 high-income states are concentrated; the remaining high-income state  is represented by Californiaon on the West Coast, creating a secondary but important opportunity cluster.
- The analysis reveales that high-earning Cities are clusted within a small set of States,rather than being evenly distributed, wealth is concentrated in a few regions , highlighting priority zones for market entry
-  Clustered wealth reduces the need to spread resources across the whole country, because these attractive markets sit near each other
-  The access on these markets is extremely advantageous , as clustered cities often share logistics, media reach, and customer behavior patterns, which can make entry and scaling more efficient
  <p align="center">
  <img src="https://github.com/user-attachments/assets/46c25fb1-c263-4592-9f5d-67b97101c893" width="700" alt="general" />
</p>

<p align="center">
  <img src="https://github.com/user-attachments/assets/2dbdd32f-c54e-4dfa-8da5-90e6d629da5c" width="230" alt="100-150k" />
  <img src="https://github.com/user-attachments/assets/e6b6e24e-e716-4bfd-97c8-e3c5da4a7c6f" width="230" alt="btw 150-200k" />
  <img src="https://github.com/user-attachments/assets/653dd36b-2c58-4a9d-ae52-86116142f8f4" width="230" alt="over 200k" />
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

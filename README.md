# E-commerce Sales & Marketing Analysis  ( E-commerce Revenue Diagnosis)

## Overview
This project analyzes e-commerce data to understand sales performance, customer behavior, and marketing efficiency using SQL.

---

## Dataset
The dataset consists of the following tables:

- customers  
- orders  
- order_items  
- products  
- marketing_spend  
- and website_session       #although we didn't include into our business quries.

---

## Project Workflow
1. Imported raw CSV data into SQL database  
2. Performed data validation and integrity checks  
3. Created an analysis dataset (`analytics_orders`)  
4. Conducted exploratory data analysis  
5. Answered key business questions  

---

## Key Business Questions
- Which product categories generate the most profit?
- Which Acquisition Channel is Most Valuable ?  
- Which acquisition channels provide the best ROI?  
- Which cities contribute the most to revenue?  
- What is monthly Growth Trend? 
- Who are the highest value customers?  
- Which products drive the most profit and should be promoted most?

---

## Key Insights
- Some product categories like "Electronice & Beauty" generate high revenue but lower profit margins  
- Certain acquisition channels like "Organic channels" deliver better ROI than others  
- A few cities contribute a major portion of total revenue                                 # (WE ARE NOT MENTIONING CITIES CAUSE OUR DATA HAVE 3000 DIFFERENT CITIES).
- High-value customers significantly impact overall sales.

---

## Tools Used
- SQL  

---

## Data Limitations & Assumptions
- The dataset was synthetically generated, so some pricing fields (`listed_price`, `selling_price`, `discount`) were not fully consistent.  
- In several cases, `listed_price` and `selling_price` were equal, limiting discount-based analysis.  
- `selling_price` was treated as the actual transaction value for revenue calculations.  
- `cost_price` was used to calculate profit.  
- Marketing spend data was aggregated at the channel level, so revenue and spend were aggregated before calculating ROI to avoid duplication issues.  

---

## Conclusion
This project demonstrates, how raw transactional data can be transformed into actionable business insights, including revenue trends, profitability, and marketing performance.
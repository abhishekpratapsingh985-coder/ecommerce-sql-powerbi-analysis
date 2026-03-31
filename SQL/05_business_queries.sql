-- =========================================================////////////
-- File: 05_business_queries.sql
-- Purpose: Answer key business questions using the dataset
-- =========================================================////////////

-- =========================================================
-- Question: Which Categories generates Highest Profit?
-- Business use: Identify categories to invest more in... 
-- =========================================================

select
    category,
    sum(revenue) as total_revenue,
    sum(profit)  as total_profit,
    sum(profit) / sum(revenue) as profit_margin
from analytics_orders
group by  category
order by total_profit desc;

-- =========================================================== 
-- Question: Which Acquisition Channel is Most Valuable ?
-- Business use: Where should we Spend More marketing budget..
-- ===========================================================

select
    acquisition_channel,
    count(distinct order_id) as total_orders,
    sum (revenue) as total_revenue,
    sum(profit) as total_profit,
    sum(profit) / sum(revenue) as profit_margin
from analytics_orders
group by acquisition_channel
order by total_profit desc;

-- =============================================================
-- Question: Which cities Drive the Business?
-- Business use: Where should we expand or focus operations?
-- =============================================================

select
    city,
    sum(revenue) as total_revenue,
    sum(profit) as total_profit
from  analytics_orders
group by city
order by total_profit desc
limit 10; 

-- =============================================================
-- Question: What Is the Monthly Growth Trend?
-- Business use: Is the business growing or declining?
-- =============================================================

select
    date_format(order_date, '%Y-%m') as month,
    sum(revenue) as total_revenue,
    sum(profit) as total_profit
from analytics_orders
group by month
order by month;  

-- ===================================================================
-- Question: Who Are the High-Value Customers?
-- Business use: Who should we retain or target with loyalty programs? 
-- ===================================================================

select
    customer_id,
    count(distinct order_id) AS total_orders,
    sum(revenue) as total_revenue,
    sum(profit) as total_profit
from analytics_orders
group by customer_id
order by total_revenue desc
limit 10;

-- =========================================================
-- Question: Which Products Should Be Promoted?
-- Business use: Which products are worth marketing more? 
-- =========================================================

select
    product_id,
    sum(quantity) as total_quantity,
    sum(revenue) as total_revenue,
    sum(profit) as total_profit
from analytics_orders
group by product_id
order by total_profit DESC
limit 10;

-- =========================================================================
-- Question: Which marketing channel provides the best return on investment?
-- Business use: To get ROI of channels
-- =========================================================================

with revenue_data as (
    select
        acquisition_channel,
        sum(revenue) as total_revenue
    from analytics_orders
    group by acquisition_channel
),

spend_data as (
    select
        channel,
        sum(spend_amount) as total_spend
    from marketing_spend
    group by channel
)

select
    r.acquisition_channel,
    r.total_revenue,
    s.total_spend,
    r.total_revenue / s.total_spend as roi
from revenue_data r
join spend_data s
on r.acquisition_channel = s.channel
order by roi desc;

-- ============================================================================
-- Question: Which channels generate the most orders relative to spend?
-- Busines use: To get to know about best channel for business.
-- ============================================================================

WITH orders_data AS (
    SELECT
        acquisition_channel,
        COUNT(DISTINCT order_id) AS total_orders
    FROM analytics_orders
    GROUP BY acquisition_channel
),

spend_data AS (
    SELECT
        channel,
        SUM(spend_amount) AS total_spend
    FROM marketing_spend
    GROUP BY channel
)

SELECT
    o.acquisition_channel,
    o.total_orders,
    s.total_spend,
    o.total_orders / s.total_spend AS orders_per_spend
FROM orders_data o
JOIN spend_data s
ON o.acquisition_channel = s.channel
ORDER BY orders_per_spend DESC;

-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// 
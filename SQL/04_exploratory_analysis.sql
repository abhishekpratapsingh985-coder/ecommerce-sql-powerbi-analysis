-- =========================================////////
-- File: 04_exploratory_analysis.sql
-- Purpose: Explore patterns in the dataset
-- =========================================////////

--  Overall Metrics -------
-- ------------------------                      # Overall Dataset Review

select
	count(distinct order_id) as total_orders,
    count(distinct customer_id) as total_customers,
    sum(revenue) as total_revenue,
    sum(profit) as total_profit
from analytics_orders;

-- Revenue by Category -------
-- ---------------------------                # Revenue Distribution by Category

select
	category,
    sum(revenue) as total_revenue,
    sum(profit) as total_profit
from analytics_orders
group by category
order by total_revenue desc;

-- Performance by acquisition chanels-------
-- -----------------------------------------      # Sales by Acquisition Channels

select 
	acquisition_channel,
    count(distinct order_id) as total_orders,
    sum(revenue) as total_revenue,
    sum(profit) as total_profit
from analytics_orders
group by acquisition_channel
order by total_revenue desc;

-- Top cities -------
-- ------------------                         # Top Cities by Revenue

select
	city,
    sum(revenue) as total_revenue,
    sum(profit) as total_profit
from analytics_orders
group by city
order by total_revenue desc;

--  Monthly Trend -------
-- ----------------------                   # Monthly Sales Trend to detect  growth/seasonality.

select 
	date_format(order_date, '%Y - %m') as month,
    sum(revenue) as total_revenue,
    sum(profit) as total_profit
from analytics_orders
group by month
order by month;

-- Average Order Value --------
-- ----------------------------                  

select 
	round(sum(revenue)/count(distinct order_id),2) as Avg_order_value
from analytics_orders;

-- Discount Distribution ---------
-- ------------------------------                # Discount exploration as (independent variable)

select
	round(avg(discount),2) as avg_discount,
    sum(discount * quantity) as total_discount_given
from analytics_orders;

-- Marketing Spend by Channel -------------
-- ----------------------------------------
select
    channel,
    sum(spend_amount) as total_spend
from marketing_spend
group by channel
order by  total_spend desc;

-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////////
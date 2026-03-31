-- / Schema_check /-----
-- =============================================
--  Purpose: - varify import worked correctly.
-- ============================================= 



-- inspecting Tables--------------------
-- -------------------------------------
select * from ecommerce_revenue_diagnosis.customers limit 10;
select * from ecommerce_revenue_diagnosis.orders limit 10;
select * from ecommerce_revenue_diagnosis.order_items limit 10;
select * from ecommerce_revenue_diagnosis.products limit 10;
select * from ecommerce_revenue_diagnosis.marketing_spend limit 10;


-- =================================
-- Count Check --  
-- =================================

select count(*) from customers;
select count(*) from orders;
select count(*) from order_items;
select count(*) from products;
select count(*) from marketing_spend;



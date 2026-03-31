-- =========================================
-- File: 02_data_validation.sql
-- Purpose: Validate data integrity
-- =========================================

--  orders without customers ------
select 
	* 
from orders 
left join customers 
	on orders.customer_id = customers.customer_id
where customers.customer_id is null;

-- order items without orders -------
select 
	*
from order_items
left join orders
	on order_items.order_id = orders.order_id
where orders.order_id is null;

--  order items without product -------
select
	* 
from order_items
left join products
	on order_items.product_id = products.product_id
where products.product_id is null;

-- Duplicate (order ids) primary key check -
select 
	order_id,
    count(*) as id_count
from orders
group by order_id
having count(*) > 1;

-- Order status distribution check --------
select
	order_status,
    count(*) as status_count
from orders
group by order_status;

-- Null checks ------
SELECT 
	*
FROM orders
WHERE order_id IS NULL
   OR customer_id IS NULL
   OR order_date IS NULL; 

-- Date range check ------

select 
	min(order_date) as start_date,
    max(order_date) as end_date
from orders;

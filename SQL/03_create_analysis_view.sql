
-- =========================================
-- File: 03_create_analysis_view.sql
-- Purpose: Create analysis-ready dataset with revenue and profit metrics
-- =========================================

CREATE VIEW analytics_orders AS
SELECT
    -- identifiers
    oi.order_item_id,
    o.order_id,
    o.order_date,
    c.customer_id,

    -- customer info
    c.city,
    c.acquisition_channel,

    -- product info
    p.product_id,
    p.category,

    -- pricing info
    p.listed_price,
    p.cost_price,
    oi.selling_price,
    oi.discount,

    -- quantity
    oi.quantity,

    -- derived metrics
    (oi.quantity * oi.selling_price) AS revenue,

    (oi.quantity * (oi.selling_price - p.cost_price)) AS profit

FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id

JOIN order_items oi
ON o.order_id = oi.order_id

JOIN products p
ON oi.product_id = p.product_id

-- only valid sales
WHERE o.order_status = 'Completed';
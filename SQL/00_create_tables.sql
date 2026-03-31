-- =========================================
-- File: 00_create_tables.sql
-- Purpose: Define schema for e-commerce analysis project
-- =========================================

-- This script creates all necessary tables required for the project.
-- The schema is designed to support transactional analysis,
-- customer behavior analysis, and marketing performance evaluation.

-- Tables:
-- 1. customers         → customer information
-- 2. orders            → order-level data
-- 3. order_items       → product-level transaction data
-- 4. products          → product details and pricing
-- 5. marketing_spend   → channel-wise marketing investment



CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    signup_date DATE,
    acquisition_channel VARCHAR(50),
    city VARCHAR(100),
    age INT
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    order_status VARCHAR(20),
    payment_method VARCHAR(50)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    selling_price DECIMAL(10,2),
    discount DECIMAL(10,2)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    category VARCHAR(100),
    cost_price DECIMAL(10,2),
    listed_price DECIMAL(10,2)
);

CREATE TABLE marketing_spend (
    month DATE,
    channel VARCHAR(50),
    spend_amount DECIMAL(10,2)
);
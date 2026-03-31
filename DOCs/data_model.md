# Data Model

customers → orders → order_items → products

## Relationships

- customers.customer_id = orders.customer_id
- orders.order_id = order_items.order_id
- order_items.product_id = products.product_id

- customers.acquisition_channel = marketing_spend.channel
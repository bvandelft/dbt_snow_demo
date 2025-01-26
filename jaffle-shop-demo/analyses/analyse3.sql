WITH all_products AS (
    SELECT DISTINCT PRODUCT_ID
    FROM order_items
),
customer_products AS (
    SELECT 
        o.CUSTOMER_ID,
        COUNT(DISTINCT oi.PRODUCT_ID) AS products_ordered_count
    FROM orders o
    JOIN order_items oi ON o.ORDER_ID = oi.ORDERID
    GROUP BY o.CUSTOMER_ID
),
product_count AS (
    SELECT COUNT(*) AS total_products
    FROM all_products
)
SELECT 
    count (distinct cp.CUSTOMER_ID)
FROM customer_products cp
JOIN product_count pc ON cp.products_ordered_count = pc.total_products
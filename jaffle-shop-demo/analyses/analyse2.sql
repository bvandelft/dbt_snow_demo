  WITH ranked_customers AS (
  SELECT
    customers.customer_id,
    customers.customer_name,
    locations.location_id,
    locations.location_name,
    COUNT(orders.order_id) AS order_count,
    RANK() OVER (
      PARTITION BY locations.location_id
      ORDER BY
        COUNT(orders.order_id) DESC
    ) AS rank
  FROM
    customers
    JOIN orders ON customers.customer_id = orders.customer_id
    JOIN locations ON orders.location_id = locations.location_id
  GROUP BY
    customers.customer_id,
    customers.customer_name,
    locations.location_id,
    locations.location_name
)
SELECT
  customer_id,
  customer_name,
  location_id,
  location_name,
  order_count
FROM
  ranked_customers
WHERE
  rank = 1
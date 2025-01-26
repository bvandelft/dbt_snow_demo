SELECT
  customers.customer_id,
  customers.customer_name,
  COUNT(DISTINCT orders.location_id) AS location_count
FROM
  customers
  JOIN orders ON customers.customer_id = orders.customer_id
GROUP BY
  customers.customer_id,
  customers.customer_name
ORDER BY
  location_count DESC
-- Get the specified data for products with a higher sales value than "grey hoodie"
SELECT items.id, items.name, items.price * COUNT(*) AS "sales total"
FROM sales_records
JOIN items
ON sales_records.item_id = items.id
GROUP BY items.id, items.name, items.price
HAVING (COUNT(*) * items.price) > (
  SELECT COUNT(*) * items.price
  FROM sales_records
  JOIN items
  ON sales_records.item_id = items.id
  WHERE items.name = "grey hoodie"
);

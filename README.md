This SQL query generates a monthly sales summary by joining `orders` and `orders_details` tables.
###  What It Shows
- **Order Year & Month**
- **Total Revenue per Month** (`order_price * qty`)
- **Number of Unique Orders per Month**

- ###  How It Works
- Uses an `INNER JOIN` to connect orders with their respective product line items.
- Calculates revenue per line item and aggregates it monthly.
- Groups results by year and month using `EXTRACT()`.
- Orders the final output chronologically.
  
###  SQL Concepts Used
- `INNER JOIN`
- `EXTRACT(YEAR/MONTH FROM order_date)`
- `SUM()` and `COUNT(DISTINCT)`
- `GROUP BY` and `ORDER BY`

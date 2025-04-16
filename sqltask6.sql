use case1;

 create table customers (
 customer_id int not null primary key,
 customer_name varchar(50) not null,
 email varchar(50)
 
);

create table orders (
 order_id int not null primary key,
 customer_id int not null,
 order_date date not null,
 total_amount decimal not null
);

create table orders_details (
 order_detail_id int not null primary key,
 order_id int not null,
 product_id int not null,
 qty int not null,
 order_price decimal not null
);

create table products (
 product_id int not null primary key,
 product_name varchar(50) not null,
 description varchar(80),
 price decimal not null,
 stock_quantity int
);

-- Insert sample data into Customers table
INSERT INTO Customers (customer_id, customer_name, email)
VALUES
  (1, 'John Smith', 'john.smith@example.com'),
  (2, 'Jane Doe', 'jane.doe@example.com'),
  (3, 'Michael Johnson', 'michael.johnson@example.com'),
  (4, 'Emily Wilson', 'emily.wilson@example.com'),
  (5, 'David Brown', 'david.brown@example.com');

 

-- Insert sample data into Products table
INSERT INTO Products (product_id, product_name, description, price, stock_quantity)
VALUES
  (1, 'iPhone X', 'Apple iPhone X, 64GB', 999, 10),
  (2, 'Galaxy S9', 'Samsung Galaxy S9, 128GB', 899, 5),
  (3, 'iPad Pro', 'Apple iPad Pro, 11-inch', 799, 8),
  (4, 'Pixel 4a', 'Google Pixel 4a, 128GB', 499, 12),
  (5, 'MacBook Air', 'Apple MacBook Air, 13-inch', 1099, 3);

 

-- Insert sample data into Orders table
INSERT INTO Orders (order_id, customer_id, order_date, total_amount)
VALUES
(1, 1, '2023-01-01', 0),
(2, 2, '2023-02-15', 0),
(3, 3, '2023-03-10', 0),
(4, 4, '2023-04-05', 0),
(5, 5, '2023-05-20', 0);


-- Insert sample data into OrderDetails table
INSERT INTO orders_details (order_detail_id, order_id, product_id, qty, order_price)
VALUES
  (1, 1, 1, 1, 999),
  (2, 2, 2, 1, 899),
  (3, 3, 3, 2, 799),
  (4, 3, 1, 1, 999),
  (5, 4, 4, 1, 499),
  (6, 4, 4, 1, 499),
  (7, 5, 5, 1, 1099),
  (8, 5, 1, 1, 999),
  (9, 5, 3, 1, 799);

 --Extracting Month (and Year) from order_date

 SELECT 
  EXTRACT(YEAR FROM order_date) AS order_year,
  EXTRACT(MONTH FROM order_date) AS order_month
FROM orders;

--Order Volume (Distinct Order Count) Per Month
SELECT 
  EXTRACT(YEAR FROM order_date) AS order_year,
  EXTRACT(MONTH FROM order_date) AS order_month,
  COUNT(DISTINCT order_id) AS order_volume
FROM orders
GROUP BY order_year, order_month
ORDER BY order_year, order_month;

-- Revenue & Volume Together Per Month

SELECT 
  EXTRACT(YEAR FROM order_date) AS order_year,
  EXTRACT(MONTH FROM order_date) AS order_month,
  SUM(total_amount) AS monthly_revenue,
  COUNT(DISTINCT order_id) AS order_volume
FROM orders
GROUP BY order_year, order_month
ORDER BY order_year, order_month;

--Sorting by Highest Revenue Month
 
SELECT 
  EXTRACT(YEAR FROM order_date) AS order_year,
  EXTRACT(MONTH FROM order_date) AS order_month,
  SUM(total_amount) AS monthly_revenue
FROM orders
GROUP BY order_year, order_month
ORDER BY monthly_revenue DESC;

--Filter for Specific Time Period
SELECT 
  EXTRACT(YEAR FROM o.order_date) AS order_year,
  EXTRACT(MONTH FROM o.order_date) AS order_month,
  SUM(od.order_price * od.qty) AS monthly_revenue,
  COUNT(DISTINCT o.order_id) AS order_volume
FROM orders o
INNER JOIN orders_details od ON o.order_id = od.order_id
GROUP BY order_year, order_month
ORDER BY order_year, order_month;

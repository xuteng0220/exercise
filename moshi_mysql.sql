USE sql_store;

SELECT order_id, o.customer_id, first_name, last_name
FROM orders o
JOIN customers c
	ON o.customer_id = c.customer_id;

SELECT order_id, oi.product_id, quantity, oi.unit_price
FROM order_items oi
JOIN products p
	ON oi.product_id = p.product_id;


-- tables across multiple databases
SELECT * 
FROM order_items oi
JOIN sql_inventory.products p
	ON oi.product_id = p.product_id;


-- join tables with itself
USE sql_hr;

SELECT
	e.employees_id,
	e.first_name,
	m.first_name AS manager
FROM employees e
JOIN employees m
	ON e.reports_to = m.employees_id


-- join more than two tables
USE sql_store;

SELECT
	o.order_id,
	o.order_date,
	c.first_name,
	c.last_name
	os.name AS status
FROM orders o
JOIN customers c
	ON o.customer_id = c.customer_id
JOIN order_statuses os
	ON o.status = os.order_statu_id;


USE sql_invoiving;





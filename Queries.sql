
-- Total revenue 
-- ====================================
SELECT SUM(p.amount) As total_revenue 
FROM payments p
JOIN orders s
ON p.order_id = s.order_id
WHERE s.order_status = "Delivered";

-- Product By revenue
-- ===================================
SELECT p.product_name,
       SUM(oi.quantity * p.price) AS revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.order_status = 'Delivered'
GROUP BY p.product_name
ORDER BY revenue DESC;

-- Top Customers by Spend
-- ===================================
SELECT c.name,
       SUM(p.amount) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN payments p ON o.order_id = p.order_id
GROUP BY c.name
ORDER BY total_spent DESC;

-- Best Selling Products
-- ===================================
SELECT p.product_name,
       SUM(oi.quantity) AS total_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC;

-- Cancelled Orders Count
-- ===================================
SELECT COUNT(*) AS cancelled_orders
FROM orders
WHERE order_status = 'Cancelled';

-- Most Expensive Product
-- ===================================
SELECT product_name, price
FROM products
ORDER BY price DESC
LIMIT 1;

-- Total Orders Per Customer
-- ===================================
SELECT customer_id, COUNT(order_id) AS total_orders
FROM orders
GROUP BY customer_id;

-- Total Orders Per Customer
-- ===================================
UPDATE products
SET stock = 30
WHERE product_id = 1;

-- Payment Mode Wise Total
-- ===================================
SELECT payment_mode, SUM(amount) AS total_collection
FROM payments
GROUP BY payment_mode;

-- Highest Quantity Ordered Product
-- ===================================
SELECT p.product_name, SUM(oi.quantity) AS total_qty
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_qty DESC
LIMIT 1;






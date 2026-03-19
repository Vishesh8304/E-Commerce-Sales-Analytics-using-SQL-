# E-Commerce Sales Analytics using SQL

> **Converting transactional data into data-driven business strategies.**

This project utilizes SQL to analyze complex e-commerce data and generate actionable insights. Through efficient data modeling, joins, and aggregations, it highlights revenue trends, top-performing products, and customer behavior to support strategic business decisions.

---

## 📋 Project Overview

### The Problem
* **Data Silos:** E-commerce data is distributed across multiple tables (Customers, Orders, Products, Payments), making analysis complex.
* **Manual Analysis:** Extracting KPIs like revenue trends, top customers, and product performance manually is time-consuming and error-prone.

### The Goal
To analyze structured e-commerce data using SQL and generate insights that help improve revenue strategies, customer targeting, and operational decisions.

---

## 🛠️ Approach

The project is built using the following steps:

1. **Database Design:** Structured relational database with tables such as Customers, Orders, Products, Order_Items, and Payments.
2. **SQL Analysis:** Wrote **15+ SQL queries** using:
   - JOINs
   - CTEs (Common Table Expressions)
   - Window Functions
   - Aggregations (SUM, COUNT)
3. **Business Logic:** Focused on analyzing delivered orders and payment trends to ensure accurate revenue insights.

---

## 🗄️ Database Structure

| Table | Key Attributes |
| :--- | :--- |
| **Customers** | `customer_id`, `name`, `email`, `city`, `signup_date` |
| **Products** | `product_id`, `product_name`, `category`, `price`, `stock` |
| **Orders** | `order_id`, `customer_id`, `order_date`, `order_status` |
| **Order_Items** | `order_item_id`, `order_id`, `product_id`, `quantity` |
| **Payments** | `payment_id`, `order_id`, `payment_mode`, `amount`, `payment_date` |

---

## 📈 Key Insights

### 1. Revenue Analysis
* Evaluated total revenue trends based on completed orders.
* Identified dominant payment mode contributing approximately **35% of total revenue**.
* Insight: Focus marketing efforts on the most used payment channel to increase conversions.

### 2. Customer Analysis
* Identified **Top 10 customers by total spending**.
* Observed repeat purchase behavior indicating strong customer retention potential.
* Recommendation: Introduce loyalty programs to improve Customer Lifetime Value (CLV).

### 3. Product Performance
* Identified **Top 5 products by quantity sold**.
* Highlighted high-demand and high-revenue products.
* Insight: Optimize inventory and marketing strategies for top-performing products.

### 4. Operational Insights
* Analyzed order status to identify cancellations and their impact.
* Insight: Reducing cancellations can directly improve revenue and customer satisfaction.

---

## 💻 Technical Highlights

The project utilizes advanced SQL techniques for efficient data analysis.

### Example Query: Revenue by Product
```sql
SELECT 
    p.product_name,
    SUM(oi.quantity * p.price) AS revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.order_status = 'Delivered'
GROUP BY p.product_name
ORDER BY revenue DESC;

# Sales Analytics System – SQL Case Study (MySQL 8+)

## Overview

This project simulates a real-world **Sales Management System** and demonstrates advanced SQL analytics techniques.

It includes:

- Relational database design
- Transactional data insertion
- Revenue and product analytics
- Customer segmentation
- Performance optimization
- Business insight reporting

The goal is to replicate how analytics queries are written in enterprise sales dashboards.

---

# Database Schema

## 1. Customers Table

Stores customer information.

| Column        | Type | Description |
|--------------|------|------------|
| customer_id  | INT (PK) | Unique customer ID |
| name         | VARCHAR | Customer name |
| email        | VARCHAR | Email address |
| city         | VARCHAR | Customer city |
| created_at   | DATE | Registration date |

---

## 2. Products Table

Stores product catalog.

| Column       | Type | Description |
|-------------|------|------------|
| product_id  | INT (PK) | Unique product ID |
| product_name| VARCHAR | Product name |
| category    | VARCHAR | Product category |
| price       | DECIMAL | Product price |

---

## 3. Orders Table

Stores order-level information.

| Column      | Type | Description |
|------------|------|------------|
| order_id   | INT (PK) | Unique order ID |
| customer_id| INT (FK) | Linked customer |
| order_date | DATE | Date of order |

---

## 4. Order_Items Table

Stores product-level details inside each order.

| Column         | Type | Description |
|---------------|------|------------|
| order_item_id | INT (PK) | Unique row ID |
| order_id      | INT (FK) | Linked order |
| product_id    | INT (FK) | Linked product |
| quantity      | INT | Units purchased |

---

# Analytical Queries Implemented

## 1️⃣ Top-Selling Products

Identifies products with highest quantity sold.

**Business Value:**
- Inventory planning
- Product performance tracking
- Demand forecasting

---

## 2️⃣ Monthly Revenue Trends

Calculates revenue grouped by month.

**Business Value:**
- Detect seasonality
- Measure growth trends
- Revenue forecasting

Also includes cumulative revenue using window functions for trend analysis.

---

## 3️⃣ Inactive Customers

Identifies customers with zero orders.

**Business Value:**
- Re-engagement campaigns
- Customer churn prevention
- Targeted promotions

---

## 4️⃣ High-Value Customers

Detects customers with total spending above threshold.

**Business Value:**
- Loyalty program qualification
- VIP segmentation
- Personalized marketing

---

## 5️⃣ Revenue Ranking

Ranks products by total revenue using window functions.

**Business Value:**
- Product prioritization
- Executive performance reporting
- Sales optimization

---

# Performance Optimization

Indexes created on:

- `orders(customer_id)`
- `order_items(product_id)`
- `orders(order_date)`

Benefits:

- Faster JOIN operations
- Faster aggregations
- Better analytical query performance

---

# Business Insights (Executive Report Style)

### Revenue Growth
Revenue shows consistent growth month-over-month, indicating stable demand and effective sales strategy.

### Product Performance
Electronics category contributes the highest revenue share.
High-ticket items significantly impact total revenue.

### Customer Segmentation
High-value customers represent major revenue contribution.
Inactive customers represent potential marketing opportunity.

### Strategic Recommendations
- Introduce loyalty rewards for top customers.
- Target inactive customers with discount campaigns.
- Increase inventory for high-demand products.
- Analyze seasonal patterns for promotional timing.

---

# Technologies Used

- MySQL 8+
- SQL Window Functions
- Aggregate Functions
- Indexing for performance optimization

---

# Real-World Applications

- E-commerce analytics dashboards
- Retail sales reporting systems
- Business intelligence tools
- Enterprise resource planning (ERP) systems
- Marketing analytics platforms

---

# Key Learning Outcomes

- Design normalized relational schema
- Write complex analytical SQL queries
- Use JOINs and aggregates effectively
- Apply window functions for ranking and trends
- Optimize queries using indexing
- Translate raw data into business insights

---


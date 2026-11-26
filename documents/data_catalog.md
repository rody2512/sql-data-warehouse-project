# Data Catalog for Gold Layer

## Overview

The Gold Layer represents the business-level data model, designed to support analytical queries and reporting. It consists of dimension tables and a fact table following a Star Schema structure.

---

### 1. gold.dim_customers

- **Purpose:** Stores customer information, including personal, demographic, and geographic attributes.

| Column Name | Data Type | Description |
|---|---|---|
| customer_key | INT | Surrogate key uniquely identifying each customer record. |
| customer_id | INT | Unique numerical identifier assigned to each customer. |
| customer_number | NVARCHAR(50) | Business identifier used to track customers. |
| first_name | NVARCHAR(50) | Customer's first name. |
| last_name | NVARCHAR(50) | Customer's last name. |
| country | NVARCHAR(50) | Customer's country of residence. |
| marital_status | NVARCHAR(50) | Customer's marital status. |
| gender | NVARCHAR(50) | Customer's gender. |
| birthdate | DATE | Customer's date of birth. |
| create_date | DATE | Date when the customer record was created. |

---

### 2. gold.dim_products

- **Purpose:** Stores product information and attributes used for product analysis and classification.

| Column Name | Data Type | Description |
|---|---|---|
| product_key | INT | Surrogate key uniquely identifying each product record. |
| product_id | INT | Unique internal product identifier. |
| product_number | NVARCHAR(50) | Business identifier representing the product. |
| product_name | NVARCHAR(50) | Descriptive name of the product. |
| category_id | NVARCHAR(50) | Identifier linking the product to its category. |
| category | NVARCHAR(50) | Main product category. |
| subcategory | NVARCHAR(50) | More specific product classification. |
| maintenance | NVARCHAR(50) | Indicates whether the product requires maintenance. |
| cost | INT | Base cost of the product. |
| product_line | NVARCHAR(50) | Product line or series. |
| start_date | DATE | Date when the product became available. |

---

### 3. gold.fact_sales

- **Purpose:** Stores transactional sales information, including orders, products, customers, and sales metrics.

| Column Name | Data Type | Description |
|---|---|---|
| order_number | NVARCHAR(50) | Unique identifier for each sales order. |
| product_key | INT | Foreign key linking sales records to dim_products. |
| customer_key | INT | Foreign key linking sales records to dim_customers. |
| order_date | DATE | Date when the order was placed. |
| shipping_date | DATE | Date when the order was shipped. |
| due_date | DATE | Expected payment due date. |
| sales_amount | INT | Total sales amount for the order line. |
| quantity | INT | Number of product units ordered. |
| price | INT | Price per unit of the product. |

---

## Data Model Relationships

The Gold Layer follows a Star Schema:

- `gold.fact_sales` is the central fact table.
- `gold.dim_customers` provides customer-related information.
- `gold.dim_products` provides product-related information.

**Relationships:**

- `dim_customers.customer_key` → `fact_sales.customer_key`
- `dim_products.product_key` → `fact_sales.product_key`

Each dimension can be related to multiple sales records (One-to-Many).

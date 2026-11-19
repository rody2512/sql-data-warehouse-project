# SQL Data Warehouse Project

## 📌 Project Overview

This project focuses on building a modern Data Warehouse using Microsoft SQL Server, following the Medallion Architecture (Bronze, Silver, and Gold layers).

The goal is to integrate data from different source systems (CRM and ERP), clean and transform the data, and build a structured data warehouse ready for analytical reporting.

This is a hands-on Data Engineering project inspired by the SQL Data Warehouse tutorial by **Baraa Khatib Salkini (Data With Baraa)**.

## 🎯 Project Objectives

- Build a modern Data Warehouse using SQL Server.
- Integrate data from multiple source systems (CRM and ERP).
- Develop ETL processes (Extract, Transform, Load).
- Apply data cleaning and transformation techniques.
- Implement the Medallion Architecture.
- Create Fact and Dimension tables.
- Design a Star Schema for analytical purposes.

## 🏗️ Data Architecture

The project follows the Medallion Architecture, consisting of three layers:

### 🥉 Bronze Layer
- Stores raw data from the source systems.
- Loads data from CSV files into SQL Server.
- Preserves the original data before transformation.

### 🥈 Silver Layer
- Cleans and standardizes raw data.
- Handles data quality issues.
- Integrates data from CRM and ERP systems.
- Prepares data for business use.

### 🥇 Gold Layer
- Contains business-ready data.
- Implements Fact and Dimension tables.
- Uses Star Schema data modeling.
- Supports analytical queries and reporting.

## 🛠️ Technologies & Tools

- Microsoft SQL Server 2025
- SQL Server Management Studio (SSMS) 22
- T-SQL
- Git & GitHub
- Draw.io

## 📂 Project Structure

```text
SQL-Data-Warehouse-Project/
│
├── datasets/
│   ├── source_crm/
│   └── source_erp/
│
├── docs/
│
├── scripts/
│   ├── bronze/
│   ├── silver/
│   └── gold/
│
├── tests/
│
└── README.md
```

## 📊 Data Sources

The project uses six CSV files from two source systems:

- CRM (Customer Relationship Management)
- ERP (Enterprise Resource Planning)

These datasets contain customer, product, sales, and related business information.

## 📈 Expected Outcomes

- A centralized Data Warehouse.
- Integrated and cleaned datasets.
- Structured analytical data models.
- Reusable SQL-based ETL processes.
- A foundation for business intelligence and reporting.

## 📚 Learning Resources & Credits

This project is based on the educational tutorial by:

**Baraa Khatib Salkini – Data With Baraa**

YouTube: https://www.youtube.com/@DataWithBaraa

Original GitHub Repository:
https://github.com/DataWithBaraa/sql-data-warehouse-project

---

**Author:** Rodina Eslam

**Field:** Data Engineering

**Project Type:** Data Warehouse & ETL



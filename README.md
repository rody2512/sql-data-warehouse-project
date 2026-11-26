# 📊 SQL Data Warehouse Project

An End-to-End Data Warehouse Implementation Using Microsoft SQL Server

## 📌 Project Overview

This project demonstrates the development of a modern SQL Server Data Warehouse that integrates data from two different source systems: **CRM** and **ERP**.

The project follows the **Medallion Architecture (Bronze, Silver, and Gold)** to build a structured data pipeline that transforms raw data into clean, consistent, and analysis-ready datasets.

The main goal is to understand and implement the complete Data Warehousing workflow, starting from raw data ingestion and ending with business-ready data for analytical queries.

## 🏗️ Data Architecture

The project follows the Medallion Architecture, which consists of three layers:

### 🥉 Bronze Layer – Raw Data
- Stores raw data directly from CRM and ERP source files.
- Loads CSV files into SQL Server.
- Preserves the original source data without applying transformations.

### 🥈 Silver Layer – Cleaned Data
- Cleans and standardizes raw data.
- Handles NULL values, duplicates, and unwanted spaces.
- Applies data transformation and validation rules.
- Uses SQL Stored Procedures to manage the loading process.
- Includes error handling and execution-time tracking.

### 🥇 Gold Layer – Business-Ready Data
- Integrates data from different source systems.
- Builds analytical data models using Fact and Dimension structures.
- Organizes data into a Star Schema for easier reporting and analysis.
- Provides business-ready datasets for analytical queries.

## 🔄 ETL Process

The project implements an ETL workflow:

1. **Extract:** Load raw CRM and ERP data from CSV files.
2. **Transform:** Clean, standardize, validate, and integrate data.
3. **Load:** Move processed data through the Bronze, Silver, and Gold layers.

## 🛠️ Technologies & Tools

- **Microsoft SQL Server** – Database management and data storage.
- **SQL Server Management Studio (SSMS)** – Writing and executing SQL queries.
- **T-SQL** – Data transformation, loading, and stored procedures.
- **Git & GitHub** – Version control and project documentation.
- **Draw.io** – Data architecture and modeling diagrams.

## 📂 Project Structure

```text
sql-data-warehouse-project/
│
├── datasets/
│   ├── source_crm/
│   └── source_erp/
│
├── scripts/
│   ├── bronze/
│   │   ├── ddl_bronze.sql
│   │   └── load_bronze.sql
│   │
│   ├── silver/
│   │   ├── ddl_silver.sql
│   │   └── load_silver.sql
│   │
│   └── gold/
│       └── ddl_gold.sql
│
├── tests/
│   └── quality_checks_silver.sql
│
├── docs/
│
└── README.md
```

## 🧪 Data Quality & Validation

Data quality checks are performed to ensure the reliability and consistency of the processed data.

Some of the validation checks include:

- Identifying NULL and duplicate values.
- Checking unwanted spaces in text columns.
- Validating date formats and date sequences.
- Checking data standardization and consistency.
- Validating sales calculations against quantity and price.

## 🚀 Project Workflow

The project execution follows these main steps:

1. Create the database and required schemas.
2. Create Bronze Layer tables.
3. Load raw CRM and ERP data into Bronze.
4. Create Silver Layer tables.
5. Implement the Silver loading Stored Procedure.
6. Apply data cleaning and transformation rules.
7. Run data quality checks.
8. Build the Gold Layer and analytical data models.

## 📚 What I Learned

Working on this project helped me gain practical experience in:

- Understanding Data Warehouse Architecture.
- Implementing the Medallion Architecture.
- Building ETL pipelines using SQL Server.
- Writing complex SQL queries and Stored Procedures.
- Using Window Functions, CTEs, CASE statements, and JOINs.
- Handling data quality issues and data inconsistencies.
- Implementing error handling using TRY...CATCH.
- Performing data validation and quality checks.
- Understanding Fact Tables, Dimension Tables, and Star Schema modeling.
- Managing projects using Git and GitHub.

## 🙏 Acknowledgment

This project was inspired by the SQL Data Warehouse tutorial by **Data With Baraa**.

Special thanks to Baraa for providing valuable learning materials and practical guidance throughout the project.

Original Repository: [Data With Baraa – SQL Data Warehouse Project](https://github.com/DataWithBaraa/sql-data-warehouse-project)

---

⭐ **Thanks for checking out my project!**

I'm continuously learning and improving my skills in SQL, Data Engineering, and Data Warehousing.

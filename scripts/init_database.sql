
/*
    Project: SQL Data Warehouse
    Description: Initialize the Data Warehouse database
    Author: Rodina Eslam
    Step 1: Create Database and Schemas
*/

-- Switch to the master database
USE master;
GO

-- Create the Data Warehouse database
CREATE DATABASE DataWarehouse;
GO

-- Switch to the Data Warehouse database
USE DataWarehouse;
GO

-- Create the Bronze, Silver, and Gold schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO

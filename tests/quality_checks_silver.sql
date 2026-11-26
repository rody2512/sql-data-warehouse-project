
/*
===============================================================================
Silver Layer - Data Quality Checks
===============================================================================

Purpose:
    This script is used to check the quality of data in the Silver Layer.

    The checks cover:
    1. Primary key validation (NULLs and duplicates).
    2. Unwanted spaces in text columns.
    3. Data standardization and consistency.
    4. Invalid dates and date sequences.
    5. Data consistency between sales, quantity, and price.

Usage:
    Run this script after loading data into the Silver Layer.

===============================================================================
*/


-- ============================================================================
-- 1. CRM CUSTOMER INFO
-- ============================================================================

-- Check for NULLs or Duplicates in Customer ID
-- Expected Result: No Results

SELECT
    cst_id,
    COUNT(*) AS duplicate_count
FROM silver.crm_cust_info
GROUP BY cst_id
HAVING COUNT(*) > 1
    OR cst_id IS NULL;


-- Check for Unwanted Spaces in Customer Names and Key
-- Expected Result: No Results

SELECT
    cst_key,
    cst_firstname,
    cst_lastname
FROM silver.crm_cust_info
WHERE cst_key != TRIM(cst_key)
    OR cst_firstname != TRIM(cst_firstname)
    OR cst_lastname != TRIM(cst_lastname);


-- Check Marital Status Standardization

SELECT DISTINCT
    cst_marital_status
FROM silver.crm_cust_info;


-- Check Gender Standardization

SELECT DISTINCT
    cst_gndr
FROM silver.crm_cust_info;


-- ============================================================================
-- 2. CRM PRODUCT INFO
-- ============================================================================

-- Check for NULLs or Duplicates in Product ID
-- Expected Result: No Results

SELECT
    prd_id,
    COUNT(*) AS duplicate_count
FROM silver.crm_prd_info
GROUP BY prd_id
HAVING COUNT(*) > 1
    OR prd_id IS NULL;


-- Check for Unwanted Spaces in Product Name
-- Expected Result: No Results

SELECT
    prd_nm
FROM silver.crm_prd_info
WHERE prd_nm != TRIM(prd_nm);


-- Check for NULL or Negative Product Costs
-- Expected Result: No Results

SELECT
    prd_cost
FROM silver.crm_prd_info
WHERE prd_cost < 0
    OR prd_cost IS NULL;


-- Check Product Line Standardization

SELECT DISTINCT
    prd_line
FROM silver.crm_prd_info;


-- Check for Invalid Product Date Ranges
-- Expected Result: No Results

SELECT
    *
FROM silver.crm_prd_info
WHERE prd_end_dt < prd_start_dt;


-- ============================================================================
-- 3. CRM SALES DETAILS
-- ============================================================================

-- Check for Invalid Dates in Bronze Source Data
-- Expected Result: No Invalid Dates

SELECT
    sls_order_dt,
    sls_ship_dt,
    sls_due_dt
FROM bronze.crm_sales_details
WHERE sls_order_dt <= 0
    OR LEN(sls_order_dt) != 8
    OR sls_ship_dt <= 0
    OR LEN(sls_ship_dt) != 8
    OR sls_due_dt <= 0
    OR LEN(sls_due_dt) != 8;


-- Check for Invalid Order Date Sequences
-- Expected Result: No Results

SELECT
    *
FROM silver.crm_sales_details
WHERE sls_order_dt > sls_ship_dt
    OR sls_order_dt > sls_due_dt;


-- Check Sales Calculation
-- Sales = Quantity * Price
-- Expected Result: No Results

SELECT DISTINCT
    sls_sales,
    sls_quantity,
    sls_price
FROM silver.crm_sales_details
WHERE sls_sales != sls_quantity * sls_price
    OR sls_sales IS NULL
    OR sls_quantity IS NULL
    OR sls_price IS NULL
    OR sls_sales <= 0
    OR sls_quantity <= 0
    OR sls_price <= 0
ORDER BY
    sls_sales,
    sls_quantity,
    sls_price;


-- ============================================================================
-- 4. ERP CUSTOMER AZ12
-- ============================================================================

-- Check for Invalid Birth Dates
-- Expected Result: Birthdates between 1924-01-01 and Today

SELECT DISTINCT
    bdate
FROM silver.erp_cust_az12
WHERE bdate < '1924-01-01'
    OR bdate > GETDATE();


-- Check Gender Standardization

SELECT DISTINCT
    gen
FROM silver.erp_cust_az12;


-- ============================================================================
-- 5. ERP LOCATION A101
-- ============================================================================

-- Check Country Standardization

SELECT DISTINCT
    cntry
FROM silver.erp_loc_a101
ORDER BY
    cntry;


-- Check for Unwanted Spaces in Country Names
-- Expected Result: No Results

SELECT
    cntry
FROM silver.erp_loc_a101
WHERE cntry != TRIM(cntry);


-- ============================================================================
-- 6. ERP PRODUCT CATEGORY G1V2
-- ============================================================================

-- Check for Unwanted Spaces in Category Columns
-- Expected Result: No Results

SELECT
    *
FROM silver.erp_px_cat_g1v2
WHERE cat != TRIM(cat)
    OR subcat != TRIM(subcat)
    OR maintenance != TRIM(maintenance);


-- Check Maintenance Values Standardization

SELECT DISTINCT
    maintenance
FROM silver.erp_px_cat_g1v2;


-- ============================================================================
-- END OF DATA QUALITY CHECKS
-- ============================================================================

-- =====================================================
-- Contoso Medallion Data Warehouse
-- Bronze Layer Quality Checks
-- =====================================================


-- =====================================================
-- Sales Validation
-- =====================================================

-- Compare row counts between source and bronze

SELECT 
    'source.sales' AS table_name,
    COUNT(*) AS row_count
FROM source.sales

UNION ALL

SELECT 
    'bronze.sales' AS table_name,
    COUNT(*) AS row_count
FROM bronze.sales;



-- Sample records

SELECT *
FROM bronze.sales
LIMIT 10;



-- =====================================================
-- Product Validation
-- =====================================================

SELECT 
    'source.product' AS table_name,
    COUNT(*) AS row_count
FROM source.product

UNION ALL

SELECT 
    'bronze.product' AS table_name,
    COUNT(*) AS row_count
FROM bronze.product;



SELECT *
FROM bronze.product
LIMIT 10;



-- =====================================================
-- Customer Validation
-- =====================================================

SELECT 
    'source.customer' AS table_name,
    COUNT(*) AS row_count
FROM source.customer

UNION ALL

SELECT 
    'bronze.customer' AS table_name,
    COUNT(*) AS row_count
FROM bronze.customer;



SELECT *
FROM bronze.customer
LIMIT 10;



-- =====================================================
-- Date Validation
-- =====================================================

SELECT 
    'source.date' AS table_name,
    COUNT(*) AS row_count
FROM source.date

UNION ALL

SELECT 
    'bronze.date' AS table_name,
    COUNT(*) AS row_count
FROM bronze.date;



SELECT *
FROM bronze.date
LIMIT 10;



-- =====================================================
-- Store Validation
-- =====================================================

SELECT 
    'source.store' AS table_name,
    COUNT(*) AS row_count
FROM source.store

UNION ALL

SELECT 
    'bronze.store' AS table_name,
    COUNT(*) AS row_count
FROM bronze.store;



SELECT *
FROM bronze.store
LIMIT 10;



-- =====================================================
-- Currency Exchange Validation
-- =====================================================

SELECT 
    'source.currencyexchange' AS table_name,
    COUNT(*) AS row_count
FROM source.currencyexchange

UNION ALL

SELECT 
    'bronze.currencyexchange' AS table_name,
    COUNT(*) AS row_count
FROM bronze.currencyexchange;



SELECT *
FROM bronze.currencyexchange
LIMIT 10;

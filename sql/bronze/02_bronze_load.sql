-- =====================================================
-- Bronze Layer Data Load
-- =====================================================


CREATE SCHEMA IF NOT EXISTS source;


-- Import Sales
IMPORT FOREIGN SCHEMA public
LIMIT TO (sales)
FROM SERVER contoso_source
INTO source;


CREATE TABLE bronze.sales AS
SELECT *
FROM source.sales;



-- Import Product
IMPORT FOREIGN SCHEMA public
LIMIT TO (product)
FROM SERVER contoso_source
INTO source;


CREATE TABLE bronze.product AS
SELECT *
FROM source.product;



-- Import Customer
IMPORT FOREIGN SCHEMA public
LIMIT TO (customer)
FROM SERVER contoso_source
INTO source;


CREATE TABLE bronze.customer AS
SELECT *
FROM source.customer;



-- Import Date
IMPORT FOREIGN SCHEMA public
LIMIT TO (date)
FROM SERVER contoso_source
INTO source;


CREATE TABLE bronze.date AS
SELECT *
FROM source.date;



-- Import Store
IMPORT FOREIGN SCHEMA public
LIMIT TO (store)
FROM SERVER contoso_source
INTO source;


CREATE TABLE bronze.store AS
SELECT *
FROM source.store;



-- Import Currency Exchange
IMPORT FOREIGN SCHEMA public
LIMIT TO (currencyexchange)
FROM SERVER contoso_source
INTO source;


CREATE TABLE bronze.currencyexchange AS
SELECT *
FROM source.currencyexchange;

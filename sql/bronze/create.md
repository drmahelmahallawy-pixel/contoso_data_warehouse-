-- =====================================================
-- Contoso Medallion Data Warehouse
-- Bronze Layer Setup
-- =====================================================

-- Create schemas
CREATE SCHEMA IF NOT EXISTS bronze;

CREATE SCHEMA IF NOT EXISTS silver;

CREATE SCHEMA IF NOT EXISTS gold;


-- Enable Foreign Data Wrapper
CREATE EXTENSION IF NOT EXISTS postgres_fdw;


-- Create source server connection
CREATE SERVER IF NOT EXISTS contoso_source
FOREIGN DATA WRAPPER postgres_fdw
OPTIONS (
    host 'localhost',
    dbname 'contoso',
    port '5432'
);


-- Create user mapping
CREATE USER MAPPING IF NOT EXISTS FOR CURRENT_USER
SERVER contoso_source
OPTIONS (
    user 'postgres',
    password 'your_password'
);

# Bronze Layer Documentation

## Overview

The Bronze Layer is the first layer in the Contoso Medallion Data Warehouse architecture.

Its main purpose is to ingest and store raw data from the source system with minimal transformations while preserving the original data structure.

The Bronze Layer acts as the foundation for all downstream transformations in the Silver and Gold layers.

---

## Architecture

---

## Technologies Used

- PostgreSQL
- DBeaver
- PostgreSQL Foreign Data Wrapper (postgres_fdw)
- GitHub for version control

---

## Source System

Database:

The source database contains transactional data including:

- Sales transactions
- Products
- Customers
- Stores
- Dates
- Currency exchange rates

---

## Bronze Layer Tables

| Source Table | Bronze Table | Description |
|-------------|--------------|-------------|
| sales | bronze.sales | Transactional sales data |
| product | bronze.product | Product master data |
| customer | bronze.customer | Customer information |
| date | bronze.date | Date dimension data |
| store | bronze.store | Store information |
| currencyexchange | bronze.currencyexchange | Currency conversion rates |

---

## Data Loading Process

The Bronze Layer loading process was implemented using PostgreSQL FDW.

Steps:

1. Created a connection between the Data Warehouse and the Contoso source database.
2. Imported source tables as foreign tables.
3. Created Bronze tables using full data extraction.
4. Validated the loaded data.

---

## Data Validation

The following checks were performed after loading:

### Row Count Validation

Source and Bronze tables were compared to ensure complete data ingestion.

Example:

```sql
SELECT COUNT(*) FROM source.sales;

SELECT COUNT(*) FROM bronze.sales;

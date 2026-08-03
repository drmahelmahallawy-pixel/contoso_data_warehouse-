# contoso_data_warehouse-
Contoso Database
        |
        | PostgreSQL FDW
        ↓
Source Schema
        |
        | Full Load
        ↓
Bronze Schema
| Source           | Bronze                  | Status |
| ---------------- | ----------------------- | ------ |
| sales            | bronze.sales            | ✅      |
| product          | bronze.product          | ✅      |
| customer         | bronze.customer         | ✅      |
| date             | bronze.date             | ✅      |
| store            | bronze.store            | ✅      |
| currencyexchange | bronze.currencyexchange | ✅      |
sql
└── bronze
    ├── 01_bronze_setup.sql
    ├── 02_bronze_load.sql
    └── 03_bronze_quality_checks.sql

    

Contoso Database
       |
       | PostgreSQL FDW
       ↓
Source Schema
       |
       | Full Load
       ↓
Bronze Schema
       |
       | Data Profiling & Quality Checks
       ↓
Silver Schema
       |
       | Standardization
       | Revenue & Total Cost
       ↓
Gold Schema
       |
       | Business Logic
       | USD Conversion
       | Profit & Analytics
       ↓
Power BI / Analytics

| Source           | Bronze                    | Silver                    | Gold                 | Status |
| ---------------- | ------------------------- | ------------------------- | -------------------- | ------ |
| sales            | `bronze.sales`            | `silver.sales`            | `gold.fact_sales`    | ✅      |
| product          | `bronze.product`          | `silver.product`          | `gold.dim_product`   | ✅      |
| customer         | `bronze.customer`         | `silver.customer`         | `gold.dim_customer`  | ✅      |
| store            | `bronze.store`            | `silver.store`            | `gold.dim_store`     | ✅      |
| currencyexchange | `bronze.currencyexchange` | `silver.currencyexchange` | Used in `fact_sales` | ✅      |

                         GOLD
                          |
             ┌────────────┴────────────┐
             │                         │
       fact_sales                 Dimensions
          TABLE                       │
             │            ┌────────────┼────────────┐
             │            │            │            │
             ▼            ▼            ▼            ▼
        Revenue USD   dim_customer  dim_product  dim_store
        Cost USD         VIEW         VIEW         VIEW
        Profit USD
        Margin
        Discount
                                                                                                                                                #pipeline
                                                                                                                                                
                                                                                                                                                SOURCE
                  ↓
        BRONZE
        Raw Full Load
                  ↓
        QUALITY CHECK
                  ↓
        SILVER
        Clean / Standardized
        + Revenue
        + Total Cost
                  ↓
        QUALITY VALIDATION
                  ↓
        GOLD
        Fact + Dimensions
        + USD Metrics
        + Profit
        + Margin
                  ↓
        Analytics / Power BI

    

-- Find areas where liquor sales are low, but demand could exist.
-- Model: liquor_deserts.sql


{{
    config(
        materialized='table'
    )
}}

select 
    county,
    sum(sale_dollars) as total_sales,
    count(distinct store_number) as num_stores
from {{ ref('stg_iowa_liquor') }}
group by county
having num_stores < 5
order by total_sales desc

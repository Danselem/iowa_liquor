{{
    config(
        materialized='table'
    )
}}

select 
    store_name,
    store_location,
    sum(sale_dollars) as total_sales,
    sum(bottles_sold) as total_bottles_sold
from {{ ref('stg_iowa_liquor_sales') }}
group by store_name, store_location
order by total_sales desc
-- Rank stores by total revenue and volume sold.


{{
    config(
        materialized='table'
    )
}}

select 
    store_number,
    store_name,
    city,
    sum(sale_dollars) as total_sales,
    sum(bottles_sold) as total_bottles_sold,
    rank() over (order by sum(sale_dollars) desc) as sales_rank
from {{ ref('stg_iowa_liquor_sales') }}
group by store_number, store_name, city
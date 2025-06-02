-- Find the top liquor categories by revenue (sale_dollars) and volume (bottles_sold).

{{
    config(
        materialized='table'
    )
}}

select 
    category_name,
    sum(sale_dollars) as total_sales,
    sum(bottles_sold) as total_bottles_sold
from {{ ref('stg_iowa_liquor') }}
group by category_name
order by total_sales desc
limit 10
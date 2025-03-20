-- Identify which counties generate the highest liquor sales.

{{
    config(
        materialized='table'
    )
}}

select 
    county,
    sum(sale_dollars) as total_sales,
    sum(volume_sold_liters) as total_volume_sold
from {{ ref('stg_iowa_liquor_sales') }}
group by county
order by total_sales desc
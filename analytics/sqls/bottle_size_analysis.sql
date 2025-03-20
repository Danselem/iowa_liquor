-- Find the most popular bottle sizes by sales volume.

{{
    config(
        materialized='table'
    )
}}

select 
    bottle_volume_ml,
    sum(bottles_sold) as total_bottles_sold
from {{ ref('stg_iowa_liquor_sales') }}
group by bottle_volume_ml
order by total_bottles_sold desc

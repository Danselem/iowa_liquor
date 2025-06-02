{{
    config(
        materialized='table'
    )
}}

select 
    store_name,
    ST_Y(store_location) as latitude,
    ST_X(store_location) as longitude,
    sum(sale_dollars) as total_sales,
    sum(bottles_sold) as total_bottles_sold
from {{ ref('stg_iowa_liquor') }}
group by store_name, latitude, longitude
order by total_sales desc

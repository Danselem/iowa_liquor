{{
    config(
        materialized='table'
    )
}}

with store_sales as (
    select 
        store_number,
        store_name,
        sum(sale_dollars) as total_sales,
        sum(bottles_sold) as total_bottles_sold,
        avg(state_bottle_retail) as avg_bottle_price
    from {{ ref('stg_iowa_liquor_sales') }}
    group by store_number, store_name
)

select *,
    ntile(4) over (order by total_sales desc) as sales_cluster,
    ntile(4) over (order by total_bottles_sold desc) as volume_cluster
from store_sales
-- Find out how price changes impact sales volume.
-- Model: price_elasticity.sql

{{
    config(
        materialized='table'
    )
}}

select 
    item_number,
    item_description,
    avg(state_bottle_retail) as avg_price,
    sum(bottles_sold) as total_bottles_sold,
    (sum(bottles_sold) - lag(sum(bottles_sold)) over (partition by item_number order by avg(state_bottle_retail))) 
    / (avg(state_bottle_retail) - lag(avg(state_bottle_retail)) over (partition by item_number order by avg(state_bottle_retail))) 
    as price_elasticity
from {{ ref('stg_iowa_liquor_sales') }}
group by item_number, item_description, avg_price
order by price_elasticity desc
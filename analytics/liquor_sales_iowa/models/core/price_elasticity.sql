-- Find out how price changes impact sales volume.
-- Model: price_elasticity.sql

{{
    config(
        materialized='table'
    )
}}

with item_stats as (
    select 
        item_number,
        item_description,
        avg(state_bottle_retail) as avg_price,
        sum(bottles_sold) as total_bottles_sold
    from {{ ref('stg_iowa_liquor') }}
    group by item_number, item_description
),

elasticity_calc as (
    select 
        *,
        lag(total_bottles_sold) over (partition by item_number order by avg_price) as prev_bottles_sold,
        lag(avg_price) over (partition by item_number order by avg_price) as prev_avg_price
    from item_stats
)

select 
    item_number,
    item_description,
    avg_price,
    total_bottles_sold,
    case
        when avg_price - prev_avg_price != 0
        then (total_bottles_sold - prev_bottles_sold) / (avg_price - prev_avg_price)
        else null
    end as price_elasticity
from elasticity_calc
where prev_bottles_sold is not null and prev_avg_price is not null
order by price_elasticity desc

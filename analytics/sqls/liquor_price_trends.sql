-- Analyze price changes of specific liquor items over time.

{{
    config(
        materialized='table'
    )
}}

select 
    item_number,
    item_description,
    date_trunc(order_date, month) as month,
    avg(state_bottle_cost) as avg_bottle_cost,
    avg(state_bottle_retail) as avg_bottle_price
from {{ ref('stg_iowa_liquor_sales') }}
group by item_number, item_description, month
order by item_number, month

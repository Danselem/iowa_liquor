-- Use window functions to predict future sales based on past trends.


{{
    config(
        materialized='table'
    )
}}

with historical_sales as (
    select 
        date_trunc(order_date, month) as month,
        sum(sale_dollars) as total_sales
    from {{ ref('stg_iowa_liquor') }}
    group by 1
)

select *,
    avg(total_sales) over (order by month rows between 3 preceding and current row) as rolling_avg_sales
from historical_sales
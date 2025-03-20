-- Aggregate total liquor sales (sale_dollars) per month to identify trends.
-- Compare year-over-year (YoY) growth in liquor sales.

{{
    config(
        materialized='table'
    )
}}

with sales as (
    select 
        date_trunc(order_date, month) as month,
        sum(sale_dollars) as total_sales,
        sum(bottles_sold) as total_bottles_sold
    from {{ ref('stg_iowa_liquor_sales') }}
    group by 1
)

select *,
    lag(total_sales) over (order by month) as prev_month_sales,
    (total_sales - lag(total_sales) over (order by month)) / lag(total_sales) over (order by month) * 100 as sales_growth_percent
from sales
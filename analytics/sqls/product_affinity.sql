{{
    config(
        materialized='table'
    )
}}

with product_pairs as (
    select 
        a.invoice_and_item_number as order_id,
        a.item_description as item_a,
        b.item_description as item_b
    from {{ ref('stg_iowa_liquor_sales') }} a
    join {{ ref('stg_iowa_liquor_sales') }} b
    on a.invoice_and_item_number = b.invoice_and_item_number
    and a.item_description < b.item_description
)

select 
    item_a, 
    item_b,
    count(*) as times_bought_together
from product_pairs
group by item_a, item_b
order by times_bought_together desc
limit 20
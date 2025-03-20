{{
    config(
        materialized='view'
    )
}}

with liquor_sales as (
    select *,
        row_number() over (partition by invoice_and_item_number) as rn
    from {{ source('staging', 'iowa_liquor_sales') }}
    where invoice_and_item_number is not null
)

select
    -- Identifiers
    {{ dbt_utils.generate_surrogate_key(['invoice_and_item_number']) }} as sales_id,
    invoice_and_item_number,
    store_number,
    store_name,
    address,
    city,
    zip_code,
    county_number,
    county,

    -- Store Location
    store_location,

    -- Product Info
    category,
    category_name,
    vendor_number,
    vendor_name,
    item_number,
    item_description,

    -- Order Details
    {{ dbt.safe_cast("pack", api.Column.translate_type("integer")) }} as pack,
    {{ dbt.safe_cast("bottle_volume_ml", api.Column.translate_type("integer")) }} as bottle_volume_ml,
    {{ dbt.safe_cast("state_bottle_cost", api.Column.translate_type("numeric")) }} as state_bottle_cost,
    {{ dbt.safe_cast("state_bottle_retail", api.Column.translate_type("numeric")) }} as state_bottle_retail,
    {{ dbt.safe_cast("bottles_sold", api.Column.translate_type("integer")) }} as bottles_sold,
    {{ dbt.safe_cast("sale_dollars", api.Column.translate_type("numeric")) }} as sale_dollars,
    {{ dbt.safe_cast("volume_sold_liters", api.Column.translate_type("numeric")) }} as volume_sold_liters,
    {{ dbt.safe_cast("volume_sold_gallons", api.Column.translate_type("numeric")) }} as volume_sold_gallons,

    -- Date
    cast(date as date) as order_date

from liquor_sales
where rn = 1

{% if var('is_test_run', default=true) %}

  limit 100

{% endif %}

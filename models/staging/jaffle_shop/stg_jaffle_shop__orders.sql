with source as (
        select * from {{ source("jaffle_shop", "orders") }}
  ),
  renamed as (
      select
        {{ adapter.quote("ID") }} as order_id,
        {{ adapter.quote("USER_ID") }} as customer_id,
        {{ adapter.quote("ORDER_DATE") }} as order_date,
        {{ adapter.quote("STATUS") }} as order_status,
        {{ dbt_utils.generate_surrogate_key(['ORDER_DATE', 'USER_ID']) }} as primary_key

      from source
  )
  select * from renamed
    
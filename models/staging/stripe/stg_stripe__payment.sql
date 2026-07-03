with source as (
        select * from {{ source("stripe", "payment") }}
  ),
  renamed as (
      select
        {{ adapter.quote("ID") }} as payment_id,
        {{ adapter.quote("ORDERID") }} as order_id,
        {{ adapter.quote("PAYMENTMETHOD") }} as payment_method,
        {{ adapter.quote("STATUS") }} as payment_status,
        {{ cents_to_dollars("AMOUNT", 4) }} as amount,
        {{ adapter.quote("CREATED") }} as created

      from source
  )
  select * from renamed
    
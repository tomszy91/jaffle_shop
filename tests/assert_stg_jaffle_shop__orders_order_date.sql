select
    order_id,
    order_date
from
    {{ ref("stg_jaffle_shop__orders") }}
where
    order_date < '1900-01-01'
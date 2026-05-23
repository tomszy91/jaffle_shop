with
customers as (
    select * from {{ ref("stg_jaffle_shop__customers")}}
),

fct_orders as (
    select * from {{ ref("fct_orders")}}
),

customer_orders as (
    select
        customer_id,
        min(order_date) as first_order_date,
        max(order_date) as last_order_date,
        count(order_id) as total_orders,
        sum(amount) as total_orders_value
    from 
        {{ ref ("fct_orders")}}
    group by
        customer_id
),

final as (
    select
        c.customer_id,
        c.first_name,
        c.last_name,
        co.first_order_date,
        co.last_order_date,
        coalesce(co.total_orders, 0) as total_orders,
        co.total_orders_value
    from customers as c left join customer_orders as co on c.customer_id = co.customer_id
)

select * from final
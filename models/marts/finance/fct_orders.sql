with
orders as (
    select * from {{ ref("stg_jaffle_shop__orders")}}
),

payments as (
    select * from {{ ref("stg_stripe__payments")}}
),

success_payment as (
    select
        order_id,
        sum(case when payment_status ='success' then amount else 0 end) as amount
    from
        payments
    group by
        order_id
),

final as (
    select
        o.order_id,
        o.customer_id,
        o.order_date,
        coalesce(p.amount, 0) as amount
    from
        orders as o left join success_payment as p on o.order_id = p.order_id
)

select * from final
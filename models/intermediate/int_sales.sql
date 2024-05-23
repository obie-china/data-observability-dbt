with 
line_item as (
    select * from {{ ref("stg_lineitem") }}
), 
orders as (
    select *  from {{ ref("stg_orders") }}
),
denormalized_sale_table as (
    select li.*, o.* exclude order_id
    from line_item li
    join
    orders o on li.order_id=o.order_id

)

select * from denormalized_sale_table
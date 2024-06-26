{{ config(materialized='view') }}

with source as (

    select * from {{ source('retail_system', 'lineitem') }}

),

renamed as (

    select
        l_orderkey as order_id,
        l_partkey as part_id,
        l_suppkey as supplier_id,
        l_linenumber as line_number,
        l_quantity as quantity,
        l_extendedprice as extended_price,
        l_discount as discount,
        l_tax as tax,
        l_returnflag as return_flag,
        l_linestatus as line_status,
        l_shipdate as ship_date,
        l_commitdate as commit_date,
        l_receiptdate as receipt_date,
        l_shipinstruct as ship_instruct,
        l_shipmode as ship_mode

    from source

)

select * from renamed
{{ config(materialized='view') }}

with source as (

    select * from {{ source('retail_system', 'customer') }}

),

renamed as (

    select
        c_custkey as customer_id,
        c_name as customer_name,
        c_address as customer_address,
        c_nationkey as nation_id,
        c_phone as customer_phone,
        c_acctbal as customer_acctbal,
        c_mktsegment as customer_mktsegment

    from source

)

select * from renamed
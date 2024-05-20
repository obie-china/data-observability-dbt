{{ config(materialized='view') }}

with source as (

    select * from {{ source('retail_system', 'supplier') }}

),

renamed as (

    select
        s_suppkey as supplier,
        s_name as supplier_name,
        s_address as supplier_address,
        s_nationkey as nation_id,
        s_phone as supplier_phone,
        s_acctbal as supplier_acctbal

    from source

)

select * from renamed
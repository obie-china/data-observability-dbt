{{ config(materialized='view') }}

with source as (

    select * from {{ source('retail_system', 'partsupp') }}

),

renamed as (

    select
        ps_partkey as part_id,
        ps_suppkey as supplier_id,
        ps_availqty as available_quantity,
        ps_supplycost as supply_cost

    from source

)

select * from renamed
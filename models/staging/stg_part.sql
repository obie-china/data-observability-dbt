{{ config(materialized='view') }}

with source as (

    select * from {{ source('retail_system', 'part') }}

),

renamed as (

    select
        p_partkey as part_id,
        p_name as part_name,
        p_mfgr as mfgr,
        p_brand as brand,
        p_type as type,
        p_size as size,
        p_container as container,
        p_retailprice as retail_price

    from source

)

select * from renamed
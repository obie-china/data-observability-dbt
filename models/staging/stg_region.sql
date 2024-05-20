{{ config(materialized='view') }}

with source as (

    select * from {{ source('retail_system', 'region') }}

),

renamed as (

    select
        r_regionkey as region_id,
        r_name as region_name

    from source

)

select * from renamed
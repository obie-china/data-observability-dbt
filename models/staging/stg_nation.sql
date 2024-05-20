{{ config(materialized='view') }}

with source as (

    select * from {{ source('retail_system', 'nation') }}

),

renamed as (

    select
        n_nationkey as nation_id,
        n_name as nation_name,
        n_regionkey as region_id

    from source

)

select * from renamed

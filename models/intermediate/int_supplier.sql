with 
suppliers as (
    select * from {{ ref("stg_supplier") }}
),
nation_and_region as (
    select na.nation_name, re.region_name, na.nation_id from {{ ref("stg_nation") }} na 
    join {{ ref("stg_region") }} re 
    on na.region_id = re.region_id
),
denormalized_supplier_table as (
    select cu.* exclude nation_id, 
    nr.nation_name, nr.region_name from suppliers cu
    join nation_and_region nr 
    on cu.nation_id = nr.nation_id
)

select * from denormalized_supplier_table
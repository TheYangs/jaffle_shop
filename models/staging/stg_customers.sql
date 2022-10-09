with source as (

    -- select * from dbt_alice.raw_customers
    select * from {{ cde_source('dbt_alice', 'raw_customers') }}

),

renamed as (

    select
        id as customer_id,
        first_name,
        last_name

    from source

)

select * from renamed

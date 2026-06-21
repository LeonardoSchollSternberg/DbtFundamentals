-- renaming columns: clarity and consistency
-- filteing rows: removing irrelevant or invalid records
-- type casting: converting data types for consistency
-- basic computations: i.e converting cents to dollards
-- basic date transformations
-- 1 to 1 source to stage

-- {{ config(materialized='view') }}

with source as (

    select
        *

    from {{ source('stripe', 'payment') }}

),

renamed as (

    select
        id as payment_id,
        orderid as order_id,
        paymentmethod as payment_method,
        status as payment_status,
        amount as payment_amount,
        created as payment_created,
        _batched_at

    from source

)

select * from renamed
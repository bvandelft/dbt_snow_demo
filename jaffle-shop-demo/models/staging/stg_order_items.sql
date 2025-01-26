with

source as (

    select * from {{ source('ecom', 'order_items') }}

),

renamed as (

    select

        ----------  ids
        id as order_item_id,
        orderid,
        sku as product_id

    from source

)

select * from renamed

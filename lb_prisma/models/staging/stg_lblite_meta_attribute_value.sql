select *

from {{ source('lb_prismahealth_dbo', 'lblite_meta_attribute_value') }}

{% if is_incremental() %}

where _FIVETRAN_SYNCED > (select max(_FIVETRAN_SYNCED) from {{ this }} )

{% endif %}
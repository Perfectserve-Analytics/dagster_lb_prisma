select *

from {{ source('prisma', 'demand_target_definitions_profile_items') }}

{% if is_incremental() %}

where _FIVETRAN_SYNCED > (select max(_FIVETRAN_SYNCED) from {{ this }} )

{% endif %}
select *

from {{ source('prisma', 'saved_locator_reports') }}

{% if is_incremental() %}

where _FIVETRAN_SYNCED > (select max(_FIVETRAN_SYNCED) from {{ this }} )

{% endif %}
select *

from {{ source('prisma', 'loareasonassignmenttypes') }}

{% if is_incremental() %}

where _FIVETRAN_SYNCED > (select max(_FIVETRAN_SYNCED) from {{ this }} )

{% endif %}
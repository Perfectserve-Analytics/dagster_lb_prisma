select *

from {{ ref('stg_batchtoassignmentmapping') }}

{% if is_incremental() %}

where _FIVETRAN_SYNCED > (select max(_FIVETRAN_SYNCED) from {{ this }} )

{% endif %}
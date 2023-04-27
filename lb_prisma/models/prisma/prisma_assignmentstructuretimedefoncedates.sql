select *

from {{ ref('stg_assignmentstructuretimedefoncedates') }}

{% if is_incremental() %}

where _FIVETRAN_SYNCED > (select max(_FIVETRAN_SYNCED) from {{ this }} )

{% endif %}
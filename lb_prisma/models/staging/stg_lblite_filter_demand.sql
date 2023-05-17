select *

from {{ source('lb_prismahealth_dbo', 'lblite_filter_demand') }}

{% if is_incremental() %}

where _FIVETRAN_SYNCED > (select max(_FIVETRAN_SYNCED) from {{ this }} )

{% endif %}
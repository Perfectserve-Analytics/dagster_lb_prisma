select *

from {{ source('lb_prismahealth_dbo', 'billing_licenses_external_ids') }}

{% if is_incremental() %}

where _FIVETRAN_SYNCED > (select max(_FIVETRAN_SYNCED) from {{ this }} )

{% endif %}
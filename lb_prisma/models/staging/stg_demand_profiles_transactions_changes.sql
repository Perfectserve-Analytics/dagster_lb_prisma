select *

from {{ source('lb_prismahealth_dbo', 'demand_profiles_transactions_changes') }}

{% if is_incremental() %}

where _FIVETRAN_SYNCED > (select max(_FIVETRAN_SYNCED) from {{ this }} )

{% endif %}
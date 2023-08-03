select *

from {{ source('lb_legacy_dbtemp_1_lblogs_dbo', 'schedulechangelogs') }}

where customerid = 1140

{% if is_incremental() %}

and _FIVETRAN_SYNCED > (select max(_FIVETRAN_SYNCED) from {{ this }} )

{% endif %}
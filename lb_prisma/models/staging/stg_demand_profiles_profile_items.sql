select
    PROFILE_ID          AS PROFILE_ID
    ,PROFILE_ITEM_ID     AS PROFILE_ITEM_ID
    ,START_TIME          AS START_TIME
    ,DEPARTMENT_ID       AS DEPTID
    ,WEIGHT              AS WEIGHT
    ,_FIVETRAN_DELETED   AS _FIVETRAN_DELETED
    ,_FIVETRAN_SYNCED    AS _FIVETRAN_SYNCED

from {{ source('prisma', 'demand_profiles_profile_items') }}

{% if is_incremental() %}

where _FIVETRAN_SYNCED > (select max(_FIVETRAN_SYNCED) from {{ this }} )

{% endif %}
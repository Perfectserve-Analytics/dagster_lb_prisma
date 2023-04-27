select
    ID                  AS ID
    ,NAME                AS NAME
    ,DEPARTMENT_ID       AS DEPTID
    ,DESCRIPTION         AS DESCRIPTION
    ,_FIVETRAN_DELETED   AS _FIVETRAN_DELETED
    ,_FIVETRAN_SYNCED    AS _FIVETRAN_SYNCED

from {{ source('prisma', 'demand_profile_items') }}

{% if is_incremental() %}

where _FIVETRAN_SYNCED > (select max(_FIVETRAN_SYNCED) from {{ this }} )

{% endif %}
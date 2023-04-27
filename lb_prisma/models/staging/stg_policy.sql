select
    DISPLAYORDER        AS DISPLAYORDER
    ,ID                  AS ID
    ,POLICY              AS POLICY
    ,PRIORITY            AS PRIORITY
    ,DEPARTMENT          AS DEPTID
    ,_FIVETRAN_DELETED   AS _FIVETRAN_DELETED
    ,_FIVETRAN_SYNCED    AS _FIVETRAN_SYNCED

from {{ source('prisma', 'policy') }}

{% if is_incremental() %}

where _FIVETRAN_SYNCED > (select max(_FIVETRAN_SYNCED) from {{ this }} )

{% endif %}
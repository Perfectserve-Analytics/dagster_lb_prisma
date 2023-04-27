select
    DEPARTMENT          AS DEPTID
    ,NAME                AS NAME
    ,TYPE                AS TYPE
    ,VALUE               AS VALUE
    ,VISIBLE             AS VISIBLE
    ,_FIVETRAN_DELETED   AS _FIVETRAN_DELETED
    ,_FIVETRAN_SYNCED    AS _FIVETRAN_SYNCED

from {{ source('prisma', 'parameters') }}

{% if is_incremental() %}

where _FIVETRAN_SYNCED > (select max(_FIVETRAN_SYNCED) from {{ this }} )

{% endif %}
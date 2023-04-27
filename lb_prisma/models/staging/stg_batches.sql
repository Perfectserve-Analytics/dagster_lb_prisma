select
    ID                  AS ID
    ,NAME                AS NAME
    ,TEMPLATENAME        AS TEMPLATENAME
    ,DESCRIPTION         AS DESCRIPTION
    ,ORDER_PRIORITY      AS ORDER_PRIORITY
    ,DEPARTMENTID        AS DEPTID
    ,_FIVETRAN_DELETED   AS _FIVETRAN_DELETED
    ,_FIVETRAN_SYNCED    AS _FIVETRAN_SYNCED

from {{ source('prisma', 'batches') }}

{% if is_incremental() %}

where _FIVETRAN_SYNCED > (select max(_FIVETRAN_SYNCED) from {{ this }} )

{% endif %}
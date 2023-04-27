select
    ID                  AS ID
    ,PERSONNEL_ID        AS PERSONNEL_ID
    ,DEPARTMENT_ID       AS DEPTID
    ,LEVEL_NAME          AS LEVEL_NAME
    ,LEVEL               AS LEVEL
    ,UPDATED_AT          AS UPDATED_AT
    ,CREATED_AT          AS CREATED_AT
    ,_FIVETRAN_DELETED   AS _FIVETRAN_DELETED
    ,_FIVETRAN_SYNCED    AS _FIVETRAN_SYNCED

from {{ source('prisma', 'personadepartments') }}

{% if is_incremental() %}

where _FIVETRAN_SYNCED > (select max(_FIVETRAN_SYNCED) from {{ this }} )

{% endif %}
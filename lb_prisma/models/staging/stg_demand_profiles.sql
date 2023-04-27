select
    ID                  AS ID
    ,END_BUFFER_MINUTES  AS END_BUFFER_MINUTES
    ,NAME                AS NAME
    ,DESCRIPTION         AS DESCRIPTION
    ,DEPARTMENT_ID       AS DEPTID
    ,_FIVETRAN_DELETED   AS _FIVETRAN_DELETED
    ,_FIVETRAN_SYNCED    AS _FIVETRAN_SYNCED

from {{ source('prisma', 'demand_profiles') }}

{% if is_incremental() %}

where _FIVETRAN_SYNCED > (select max(_FIVETRAN_SYNCED) from {{ this }} )

{% endif %}
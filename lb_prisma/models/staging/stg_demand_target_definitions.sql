select
    ID                  AS ID
    ,NAME                AS NAME
    ,DESCRIPTION         AS DESCRIPTION
    ,DEPARTMENT_ID       AS DEPTID
    ,_FIVETRAN_DELETED   AS _FIVETRAN_DELETED
    ,_FIVETRAN_SYNCED    AS _FIVETRAN_SYNCED

from {{ source('lb_prismahealth_dbo', 'demand_target_definitions') }}

{% if is_incremental() %}

where _FIVETRAN_SYNCED > (select max(_FIVETRAN_SYNCED) from {{ this }} )

{% endif %}
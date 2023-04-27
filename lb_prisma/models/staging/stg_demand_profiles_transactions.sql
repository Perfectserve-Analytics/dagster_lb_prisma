select
    ID                  AS ID
    ,TIMESTAMP           AS TIMESTAMP
    ,MODIFIED_BY         AS MODIFIED_BY
    ,TYPE                AS TYPE
    ,DEPARTMENT_ID       AS DEPTID
    ,IS_SYNCHRONIZED     AS IS_SYNCHRONIZED
    ,PROFILE_ID          AS PROFILE_ID
    ,_FIVETRAN_DELETED   AS _FIVETRAN_DELETED
    ,_FIVETRAN_SYNCED    AS _FIVETRAN_SYNCED

from {{ source('prisma', 'demand_profiles_transactions') }}

{% if is_incremental() %}

where _FIVETRAN_SYNCED > (select max(_FIVETRAN_SYNCED) from {{ this }} )

{% endif %}
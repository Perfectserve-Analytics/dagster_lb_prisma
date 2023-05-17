select
    ASSIGNID_A                      AS ASSIGNID_A
    ,ASSIGNID_B                      AS ASSIGNID_B
    ,DEPARTMENT                      AS DEPTID
    ,ASSIGNID_A_TIME_BREAKABLE       AS ASSIGNID_A_TIME_BREAKABLE
    ,INCOMPATIBLE_OVERLAPPING_TIMES  AS INCOMPATIBLE_OVERLAPPING_TIMES
    ,EXCLUSIVITY                     AS EXCLUSIVITY
    ,SCHEDTYPENAME                   AS SCHEDTYPENAME
    ,ASSIGNID_B_TIME_BREAKABLE       AS ASSIGNID_B_TIME_BREAKABLE
    ,ID                              AS ID
    ,_FIVETRAN_DELETED               AS _FIVETRAN_DELETED
    ,_FIVETRAN_SYNCED                AS _FIVETRAN_SYNCED

from {{ source('lb_prismahealth_dbo', 'exclusivity') }}

{% if is_incremental() %}

where _FIVETRAN_SYNCED > (select max(_FIVETRAN_SYNCED) from {{ this }} )

{% endif %}
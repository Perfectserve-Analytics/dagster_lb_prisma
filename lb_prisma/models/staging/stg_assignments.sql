select
    ID                              AS ID
    ,ASSIGNMENT_TYPE_ID              AS ASSIGNMENT_TYPE_ID
    ,ROUNDTARGETTEMPLATENAME         AS ROUNDTARGETTEMPLATENAME
    ,DESCRIPTION                     AS DESCRIPTION
    ,COMPATIBILITY_TIME_BREAKABLE    AS COMPATIBILITY_TIME_BREAKABLE
    ,CATEGORY_ID                     AS CATEGORY_ID
    ,WORKUNITTYPE                    AS WORKUNITTYPE
    ,ASSIGNMENT                      AS ASSIGNMENT
    ,DURATION                        AS DURATION
    ,HAS_MULTIPLE_LOCATIONS          AS HAS_MULTIPLE_LOCATIONS
    ,DEPARTMENT                      AS DEPTID
    ,EDITABLE_LOCATIONS              AS EDITABLE_LOCATIONS
    ,ROUNDTEMPLATENAME               AS ROUNDTEMPLATENAME
    ,SYSTEMASS                       AS SYSTEMASS
    ,ISROUND                         AS ISROUND
    ,LOCATION_ID                     AS LOCATION_ID
    ,STARTDAY                        AS STARTDAY
    ,_FIVETRAN_DELETED               AS _FIVETRAN_DELETED
    ,_FIVETRAN_SYNCED                AS _FIVETRAN_SYNCED
    ,CALL_ORDER                      AS CALL_ORDER

from {{ source('prisma', 'assignments') }}

{% if is_incremental() %}

where _FIVETRAN_SYNCED > (select max(_FIVETRAN_SYNCED) from {{ this }} )

{% endif %}
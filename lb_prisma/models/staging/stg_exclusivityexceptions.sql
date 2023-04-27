select
    CONTEXTID           AS CONTEXTID
    ,DEPARTMENT          AS DEPTID
    ,ASSIGNID_THIS       AS ASSIGNID_THIS
    ,ASSIGNID_THAT       AS ASSIGNID_THAT
    ,ASSIGNID            AS ASSIGNID
    ,ID                  AS ID
    ,_FIVETRAN_DELETED   AS _FIVETRAN_DELETED
    ,_FIVETRAN_SYNCED    AS _FIVETRAN_SYNCED

from {{ source('prisma', 'exclusivityexceptions') }}

{% if is_incremental() %}

where _FIVETRAN_SYNCED > (select max(_FIVETRAN_SYNCED) from {{ this }} )

{% endif %}
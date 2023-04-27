select
    ID                  AS ID
    ,COLOR               AS COLOR
    ,DESCRIPTION         AS DESCRIPTION
    ,SHORTNAME           AS SHORTNAME
    ,SYSTEMDEFINED       AS SYSTEMDEFINED
    ,TYPE                AS TYPE
    ,ACCESSLEVEL         AS ACCESSLEVEL
    ,DEPARTMENT          AS DEPTID
    ,PRIORITY            AS PRIORITY
    ,_FIVETRAN_DELETED   AS _FIVETRAN_DELETED
    ,_FIVETRAN_SYNCED    AS _FIVETRAN_SYNCED

from {{ source('prisma', 'prioritylevel') }}

{% if is_incremental() %}

where _FIVETRAN_SYNCED > (select max(_FIVETRAN_SYNCED) from {{ this }} )

{% endif %}
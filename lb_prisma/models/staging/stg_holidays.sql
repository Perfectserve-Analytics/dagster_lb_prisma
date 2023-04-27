select
    ID                  AS ID
    ,DESCRIPTION         AS DESCRIPTION
    ,DURATION            AS DURATION
    ,LASTMODIFIEDBY      AS LASTMODIFIEDBY
    ,DEPARTMENT          AS DEPTID
    ,MONTH               AS MONTH
    ,FREQUENCY           AS FREQUENCY
    ,ENDDATE             AS ENDDATE
    ,LASTMODIFIEDDATE    AS LASTMODIFIEDDATE
    ,NUM                 AS NUM
    ,DAYOFWEEK           AS DAYOFWEEK
    ,FREQUENCYNUM        AS FREQUENCYNUM
    ,USEDAYOFWEEK        AS USEDAYOFWEEK
    ,HOLIDAY             AS HOLIDAY
    ,DATE                AS DATE
    ,_FIVETRAN_DELETED   AS _FIVETRAN_DELETED
    ,_FIVETRAN_SYNCED    AS _FIVETRAN_SYNCED

from {{ source('prisma', 'holidays') }}

{% if is_incremental() %}

where _FIVETRAN_SYNCED > (select max(_FIVETRAN_SYNCED) from {{ this }} )

{% endif %}
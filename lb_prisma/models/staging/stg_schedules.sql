select
    SCHEDID             AS SCHEDID
    ,SCHEDULENAME        AS SCHEDULENAME
    ,ISPUBLIC            AS ISPUBLIC
    ,SCHEDTYPENAME       AS SCHEDTYPENAME
    ,MAPREFRESHEDTIME    AS MAPREFRESHEDTIME
    ,CREATEDDATE         AS CREATEDDATE
    ,NOTES               AS NOTES
    ,CREATEDBY           AS CREATEDBY
    ,DEPARTMENT          AS DEPTID
    ,LASTMODIFIEDBY      AS LASTMODIFIEDBY
    ,STOPDATE            AS STOPDATE
    ,STARTDATE           AS STARTDATE
    ,DELETED             AS DELETED
    ,ARCHIVED            AS ARCHIVED
    ,DONTBLOCKREQUESTS   AS DONTBLOCKREQUESTS
    ,FINAL               AS FINAL
    ,LASTMODIFIED        AS LASTMODIFIED
    ,_FIVETRAN_DELETED   AS _FIVETRAN_DELETED
    ,_FIVETRAN_SYNCED    AS _FIVETRAN_SYNCED

from {{ source('lb_prismahealth_dbo', 'schedules') }}

{% if is_incremental() %}

where _FIVETRAN_SYNCED > (select max(_FIVETRAN_SYNCED) from {{ this }} )

{% endif %}
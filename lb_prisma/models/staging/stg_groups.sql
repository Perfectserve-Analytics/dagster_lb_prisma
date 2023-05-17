select
    ID                  AS ID
    ,MEMBEROF            AS MEMBEROF
    ,SYSTEMGROUP         AS SYSTEMGROUP
    ,FORECOLORRGB        AS FORECOLORRGB
    ,GROUPNAME           AS GROUPNAME
    ,MEMBERCOLOR         AS MEMBERCOLOR
    ,DESCRIPTION         AS DESCRIPTION
    ,LASTMODIFIEDDATE    AS LASTMODIFIEDDATE
    ,LASTMODIFIEDBY      AS LASTMODIFIEDBY
    ,ALLROLES            AS ALLROLES
    ,MEMBERFONT          AS MEMBERFONT
    ,DEPARTMENT          AS DEPTID
    ,_FIVETRAN_DELETED   AS _FIVETRAN_DELETED
    ,_FIVETRAN_SYNCED    AS _FIVETRAN_SYNCED

from {{ source('lb_prismahealth_dbo', 'groups') }}

{% if is_incremental() %}

where _FIVETRAN_SYNCED > (select max(_FIVETRAN_SYNCED) from {{ this }} )

{% endif %}
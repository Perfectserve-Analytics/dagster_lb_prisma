select 
    ID                  AS ID
    ,SYSTEMGROUP         AS SYSTEMGROUP
    ,BACKCOLORRGB        AS BACKCOLORRGB
    ,DESCRIPTION         AS DESCRIPTION
    ,MEMBEROF            AS MEMBEROF
    ,BACKCOLOR           AS BACKCOLOR
    ,DEPARTMENT          AS DEPTID
    ,LASTMODIFIEDBY      AS LASTMODIFIEDBY
    ,GROUPNAME           AS GROUPNAME
    ,LASTMODIFIEDDATE    AS LASTMODIFIEDDATE
    ,_FIVETRAN_DELETED   AS _FIVETRAN_DELETED
    ,_FIVETRAN_SYNCED    AS _FIVETRAN_SYNCED

from {{ source('lb_prismahealth_dbo', 'assigngroup') }}

{% if is_incremental() %}

where _FIVETRAN_SYNCED > (select max(_FIVETRAN_SYNCED) from {{ this }} )

{% endif %}
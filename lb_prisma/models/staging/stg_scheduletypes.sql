select
    NAME                                AS NAME
    ,BETWEENCALLS                        AS BETWEENCALLS
    ,SHORTDESCRIPTION                    AS SHORTDESCRIPTION
    ,DESCRIPTION                         AS DESCRIPTION
    ,DEPARTMENT                          AS DEPTID
    ,PERIODSTOPDATE                      AS PERIODSTOPDATE
    ,WHITEBOARDTEXT                      AS WHITEBOARDTEXT
    ,ID                                  AS ID
    ,HISTSTARTDATE                       AS HISTSTARTDATE
    ,CALENDARSTYLE                       AS CALENDARSTYLE
    ,TOTALCONTEXTS                       AS TOTALCONTEXTS
    ,USEHISTSTAT                         AS USEHISTSTAT
    ,CORESCHEDULERRELOADCOLUMNS          AS CORESCHEDULERRELOADCOLUMNS
    ,CUSTOMTALLYTARGETS                  AS CUSTOMTALLYTARGETS
    ,NEEDSCORESCHEDULERRELOADTIMESTAMP   AS NEEDSCORESCHEDULERRELOADTIMESTAMP
    ,BETWEENASSIGNMENTS                  AS BETWEENASSIGNMENTS
    ,USESENIORITY                        AS USESENIORITY
    ,TOTALSCHEDULED                      AS TOTALSCHEDULED
    ,BETWEENCONTEXTS                     AS BETWEENCONTEXTS
    ,CORESCHEDULERRELOADTABLE            AS CORESCHEDULERRELOADTABLE
    ,STAFFPAIRING                        AS STAFFPAIRING
    ,SCHEDTYPEID                         AS SCHEDTYPEID
    ,CALENDARFONT                        AS CALENDARFONT
    ,PERIODSTARTDATE                     AS PERIODSTARTDATE
    ,TOTALASSIGNMENTS                    AS TOTALASSIGNMENTS
    ,_FIVETRAN_DELETED                   AS _FIVETRAN_DELETED
    ,_FIVETRAN_SYNCED                    AS _FIVETRAN_SYNCED

from {{ source('lb_prismahealth_dbo', 'scheduletypes') }}

{% if is_incremental() %}

where _FIVETRAN_SYNCED > (select max(_FIVETRAN_SYNCED) from {{ this }} )

{% endif %}
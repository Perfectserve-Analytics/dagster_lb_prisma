select
    ID                  AS ID
    ,ONTHESEDAYS         AS ONTHESEDAYS
    ,FIRST               AS FIRST
    ,OFFCALL             AS OFFCALL
    ,FOURTH              AS FOURTH
    ,ONTHESEWEEKS        AS ONTHESEWEEKS
    ,ONTHISHOLIDAY       AS ONTHISHOLIDAY
    ,ENTIREPERIOD        AS ENTIREPERIOD
    ,BEGINDATE           AS BEGINDATE
    ,MAXVALUE            AS MAXVALUE
    ,MINVALUE            AS MINVALUE
    ,UNITTYPE            AS UNITTYPE
    ,GROUPID             AS GROUPID
    ,PRIORITYLEVELID     AS PRIORITYLEVELID
    ,SECOND              AS SECOND
    ,SCHEDTYPENAME       AS SCHEDTYPENAME
    ,NTHDAYOFMONTH       AS NTHDAYOFMONTH
    ,SIXTH               AS SIXTH
    ,NUM2                AS NUM2
    ,ACTIVEIN            AS ACTIVEIN
    ,FREQUENCY           AS FREQUENCY
    ,FIFTH               AS FIFTH
    ,DEPARTMENT          AS DEPTID
    ,MIPRULEID           AS MIPRULEID
    ,NUM                 AS NUM
    ,BYGROUP             AS BYGROUP
    ,NUMTIMES            AS NUMTIMES
    ,EMPID               AS EMPID
    ,EVERYMONTHOFYEAR    AS EVERYMONTHOFYEAR
    ,UNITTYPE2           AS UNITTYPE2
    ,DESCRIPTION         AS DESCRIPTION
    ,ENTEREDDATE         AS ENTEREDDATE
    ,THIRD               AS THIRD
    ,ONALLHOLIDAYS       AS ONALLHOLIDAYS
    ,NAME                AS NAME
    ,PRIORITYPOINTS      AS PRIORITYPOINTS
    ,BID                 AS BID
    ,EVERYNWEEKS         AS EVERYNWEEKS
    ,ISCONVERTED         AS ISCONVERTED
    ,EVERYDAYOFYEAR      AS EVERYDAYOFYEAR
    ,STATUS              AS STATUS
    ,ASSIGNMENT          AS ASSIGNMENT
    ,EVERYNTHDAY         AS EVERYNTHDAY
    ,DAYOFWEEK           AS DAYOFWEEK
    ,ENDDATE             AS ENDDATE
    ,SEVENTH             AS SEVENTH
    ,HOLIDAYID           AS HOLIDAYID
    ,_FIVETRAN_DELETED   AS _FIVETRAN_DELETED
    ,_FIVETRAN_SYNCED    AS _FIVETRAN_SYNCED

from {{ source('lb_prismahealth_dbo', 'preference') }}

{% if is_incremental() %}

where _FIVETRAN_SYNCED > (select max(_FIVETRAN_SYNCED) from {{ this }} )

{% endif %}
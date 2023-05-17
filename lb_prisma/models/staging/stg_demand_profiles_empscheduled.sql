select
    EMPSCHEDULED_ID                     AS EMPSCHEDULED_ID
    ,SLOT_DATE                           AS SLOT_DATE
    ,STOP_TIME                           AS STOP_TIME
    ,PROFILE_ID                          AS PROFILE_ID
    ,TEMPLATE_ID                         AS TEMPLATE_ID
    ,PERSONNEL_ID                        AS PERSONNEL_ID
    ,ASSIGNMENT_ID                       AS ASSIGNMENT_ID
    ,ASSIGNMENT_STRUCTURE_ID             AS ASSIGNMENT_STRUCTURE_ID
    ,STOP_TIME_ACTUAL                    AS STOP_TIME_ACTUAL
    ,TIMES_INHERITED_FROM_ASSIGNMENT     AS TIMES_INHERITED_FROM_ASSIGNMENT
    ,SCHEDULE_ID                         AS SCHEDULE_ID
    ,DEPARTMENT_ID                       AS DEPTID
    ,START_TIME                          AS START_TIME
    ,END_BUFFER_MINUTES                  AS END_BUFFER_MINUTES
    ,_FIVETRAN_DELETED                   AS _FIVETRAN_DELETED
    ,_FIVETRAN_SYNCED                    AS _FIVETRAN_SYNCED

from {{ source('lb_prismahealth_dbo', 'demand_profiles_empscheduled') }}

{% if is_incremental() %}

where _FIVETRAN_SYNCED > (select max(_FIVETRAN_SYNCED) from {{ this }} )

{% endif %}
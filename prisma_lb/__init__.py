from dagster import (
    Definitions,
    ScheduleDefinition,
    define_asset_job,
    load_assets_from_package_module,
)
from . import assets
from dagster_dbt import dbt_cli_resource

resources = {
    'dbt': dbt_cli_resource.configured(
        {
            'project_dir': assets.DBT_PROJECT,
            'profiles_dir': assets.DBT_PROFILES
        }
    )
}

daily_refresh_schedule = ScheduleDefinition(
    job=define_asset_job(name="all_assets_job"),
    cron_schedule="0 10 * * *"
)

defs = Definitions(
    assets=load_assets_from_package_module(assets),
    resources=resources,
    schedules=[daily_refresh_schedule]
)

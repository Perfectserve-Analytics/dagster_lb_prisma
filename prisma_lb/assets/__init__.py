from dagster_dbt import load_assets_from_dbt_project
from dagster import file_relative_path

DBT_PROJECT = file_relative_path(__file__, "../../lb_prisma")
DBT_PROFILES = file_relative_path(__file__, "../../lb_prisma/config")

dbt_assets = load_assets_from_dbt_project(
    project_dir=DBT_PROJECT,
    profiles_dir=DBT_PROFILES
)
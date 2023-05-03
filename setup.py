from setuptools import find_packages, setup

if __name__ == "__main__":
    setup(
        name="prisma_lb",
        packages=find_packages(exclude=["prisma_lb_tests"]),
        install_requires=[
            "dagster",
            "dagster-cloud",
            "dagster-dbt",
            "dagster-snowflake",
            "dbt-core",
            "dbt-snowflake",
            "pandas",
            "matplotlib",
        ],
        extras_require={"dev": ["dagit", "pytest"]},
    )

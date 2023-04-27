from setuptools import find_packages, setup

setup(
    name="prisma_lb",
    packages=find_packages(exclude=["prisma_lb_tests"]),
    install_requires=[
        "dagster",
        "dagster-cloud",
        "dagster-dbt",
        "dagster-snowflake",
        "dbt-core",
        "boto3",
        "pandas",
        "matplotlib",
        "textblob",
        "tweepy",
        "wordcloud",
    ],
    extras_require={"dev": ["dagit", "pytest"]},
)

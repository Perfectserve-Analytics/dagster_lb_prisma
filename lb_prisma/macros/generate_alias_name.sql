{% macro generate_alias_name(custom_alias_name=none, node=none) -%}

    {%- if custom_alias_name -%}

        {{ custom_alias_name | trim }}

    {%- else -%}

        {{ node.name[node.name.find("_")+1:] }}

    {%- endif -%}

{%- endmacro %}
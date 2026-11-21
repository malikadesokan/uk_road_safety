{% macro get_casualty_table(table_name) %}

    SELECT * 
    FROM {{source('DfT_casualty_lookup', table_name) }}

{% endmacro %}
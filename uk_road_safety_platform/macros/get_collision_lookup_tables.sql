{% macro get_lookup_table(table_name) %}

    SELECT
        *
    FROM {{ source('DfT_collision_lookup', table_name) }}

{% endmacro %}
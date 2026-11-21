{% macro get_vehicle_lookup_table(table_name) %}

    SELECT
        *
    FROM {{ source('DfT_vehicle_lookup', table_name) }}

{% endmacro %}
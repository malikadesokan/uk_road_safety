WITH weather_conditions AS (
    {{ get_lookup_table('weather_conditions_col_lookup_table') }}
)

SELECT * FROM weather_conditions;

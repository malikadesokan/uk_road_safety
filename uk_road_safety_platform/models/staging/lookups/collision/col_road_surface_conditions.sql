WITH road_surface_conditions AS (
    {{ get_lookup_table('road_surface_conditions_col_lookup_table') }}
)

SELECT * FROM road_surface_conditions;

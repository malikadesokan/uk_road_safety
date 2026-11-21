WITH road_type AS (
    {{ get_lookup_table('road_type_col_lookup_table') }}
)

SELECT * FROM road_type;

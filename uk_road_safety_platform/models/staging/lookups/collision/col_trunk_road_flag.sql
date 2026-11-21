WITH trunk_road_flag AS (
    {{ get_lookup_table('trunk_road_flag_col_lookup_table') }}
)

SELECT * FROM trunk_road_flag;

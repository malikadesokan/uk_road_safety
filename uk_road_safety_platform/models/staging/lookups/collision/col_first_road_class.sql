WITH first_road_class AS (
    {{ get_lookup_table('first_road_class_col_lookup_table') }}
)

SELECT * FROM first_road_class;

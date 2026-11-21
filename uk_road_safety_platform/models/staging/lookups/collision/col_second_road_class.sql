WITH second_road_class AS (
    {{ get_lookup_table('second_road_class_col_lookup_table') }}
)

SELECT * FROM second_road_class;

WITH pedestrian_crossing AS (
    {{ get_lookup_table('pedestrian_crossing_col_lookup_table') }}
)

SELECT * FROM pedestrian_crossing;

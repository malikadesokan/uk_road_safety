WITH pedestrian_crossing_human_control_historic AS (
    {{ get_lookup_table('pedestrian_crossing_human_control_historic_col_lookup_table') }}
)

SELECT * FROM pedestrian_crossing_human_control_historic;

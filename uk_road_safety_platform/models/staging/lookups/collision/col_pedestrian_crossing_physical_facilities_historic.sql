WITH pedestrian_crossing_physical_facilities_historic AS (
    {{ get_lookup_table('pedestrian_crossing_physical_facilities_historic_col_lookup_table') }}
)

SELECT * FROM pedestrian_crossing_physical_facilities_historic;

WITH pedestrian_location AS (
    {{ get_casualty_table('pedestrian_location_cas_lookup_table') }}
)

SELECT * FROM pedestrian_location;

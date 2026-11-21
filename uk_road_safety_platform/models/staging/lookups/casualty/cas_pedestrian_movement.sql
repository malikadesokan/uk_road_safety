WITH pedestrian_movement AS (
    {{ get_casualty_table('pedestrian_movement_cas_lookup_table') }}
)

SELECT * FROM pedestrian_movement;

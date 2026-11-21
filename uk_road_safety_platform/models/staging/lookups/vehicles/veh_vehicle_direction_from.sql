WITH vehicle_direction_from AS (
    {{ get_vehicle_lookup_table('vehicle_direction_from_veh_lookup_table') }}
)

SELECT * FROM vehicle_direction_from;

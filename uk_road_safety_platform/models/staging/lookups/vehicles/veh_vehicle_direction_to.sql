WITH vehicle_direction_to AS (
    {{ get_vehicle_lookup_table('vehicle_direction_to_veh_lookup_table') }}
)

SELECT * FROM vehicle_direction_to;

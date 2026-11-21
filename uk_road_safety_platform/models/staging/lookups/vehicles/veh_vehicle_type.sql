WITH vehicle_type AS (
    {{ get_vehicle_lookup_table('vehicle_type_veh_lookup_table') }}
)

SELECT * FROM vehicle_type;

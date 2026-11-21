WITH vehicle_leaving_carriageway AS (
    {{ get_vehicle_lookup_table('vehicle_leaving_carriageway_veh_lookup_table') }}
)

SELECT * FROM vehicle_leaving_carriageway;

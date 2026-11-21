WITH junction_location AS (
    {{ get_vehicle_lookup_table('junction_location_veh_lookup_table') }}
)

SELECT * FROM junction_location;

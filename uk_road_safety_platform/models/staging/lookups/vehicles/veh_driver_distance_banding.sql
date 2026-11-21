WITH driver_distance_banding AS (
    {{ get_vehicle_lookup_table('driver_distance_banding_veh_lookup_table') }}
)

SELECT * FROM driver_distance_banding;

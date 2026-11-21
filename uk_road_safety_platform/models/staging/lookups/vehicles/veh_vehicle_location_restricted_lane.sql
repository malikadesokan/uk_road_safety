WITH vehicle_location_restricted_lane AS (
    {{ get_vehicle_lookup_table('vehicle_location_restricted_lane_veh_lookup_table') }}
)

SELECT * FROM vehicle_location_restricted_lane;

WITH vehicle_location_restricted_lane_historic AS (
    {{ get_vehicle_lookup_table('vehicle_location_restricted_lane_historic_veh_lookup_table') }}
)

SELECT * FROM vehicle_location_restricted_lane_historic;

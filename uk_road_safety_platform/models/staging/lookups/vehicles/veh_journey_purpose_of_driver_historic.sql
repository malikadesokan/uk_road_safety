WITH journey_purpose_of_driver_historic AS (
    {{ get_vehicle_lookup_table('journey_purpose_of_driver_historic_veh_lookup_table') }}
)

SELECT * FROM journey_purpose_of_driver_historic;

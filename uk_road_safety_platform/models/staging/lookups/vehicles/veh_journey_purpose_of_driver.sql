WITH journey_purpose_of_driver AS (
    {{ get_vehicle_lookup_table('journey_purpose_of_driver_veh_lookup_table') }}
)

SELECT * FROM journey_purpose_of_driver;

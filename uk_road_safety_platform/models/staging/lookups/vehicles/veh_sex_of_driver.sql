WITH sex_of_driver AS (
    {{ get_vehicle_lookup_table('sex_of_driver_veh_lookup_table') }}
)

SELECT * FROM sex_of_driver;

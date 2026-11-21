WITH age_band_of_driver AS (
    {{ get_vehicle_lookup_table('age_band_of_driver_veh_lookup_table') }}
)

SELECT * FROM age_band_of_driver;

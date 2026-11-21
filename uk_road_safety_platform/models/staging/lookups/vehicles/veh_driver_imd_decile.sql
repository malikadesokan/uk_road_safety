WITH driver_imd_decile AS (
    {{ get_vehicle_lookup_table('driver_imd_decile_veh_lookup_table') }}
)

SELECT * FROM driver_imd_decile;

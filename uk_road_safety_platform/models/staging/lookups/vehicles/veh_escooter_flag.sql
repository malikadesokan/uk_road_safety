WITH escooter_flag AS (
    {{ get_vehicle_lookup_table('escooter_flag_veh_lookup_table') }}
)

SELECT * FROM escooter_flag;

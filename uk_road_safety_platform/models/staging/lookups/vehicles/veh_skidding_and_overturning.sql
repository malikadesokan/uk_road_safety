WITH skidding_and_overturning AS (
    {{ get_vehicle_lookup_table('skidding_and_overturning_veh_lookup_table') }}
)

SELECT * FROM skidding_and_overturning;

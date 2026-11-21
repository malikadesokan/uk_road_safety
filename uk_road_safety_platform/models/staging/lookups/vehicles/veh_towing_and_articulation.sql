WITH towing_and_articulation AS (
    {{ get_vehicle_lookup_table('towing_and_articulation_veh_lookup_table') }}
)

SELECT * FROM towing_and_articulation;

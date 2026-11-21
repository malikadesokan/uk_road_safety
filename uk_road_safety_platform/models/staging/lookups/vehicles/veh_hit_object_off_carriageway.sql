WITH hit_object_off_carriageway AS (
    {{ get_vehicle_lookup_table('hit_object_off_carriageway_veh_lookup_table') }}
)

SELECT * FROM hit_object_off_carriageway;

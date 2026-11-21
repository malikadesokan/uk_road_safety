WITH pedestrian_road_maintenance_worker AS (
    {{ get_casualty_table('pedestrian_road_maintenance_worker_cas_lookup_table') }}
)

SELECT * FROM pedestrian_road_maintenance_worker;

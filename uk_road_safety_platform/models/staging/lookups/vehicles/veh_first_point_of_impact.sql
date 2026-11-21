WITH first_point_of_impact AS (
    {{ get_vehicle_lookup_table('first_point_of_impact_veh_lookup_table') }}
)

SELECT * FROM first_point_of_impact;

WITH propulsion_code AS (
    {{ get_vehicle_lookup_table('propulsion_code_veh_lookup_table') }}
)

SELECT * FROM propulsion_code;

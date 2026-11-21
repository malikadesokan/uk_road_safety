WITH vehicle_manoeuvre AS (
    {{ get_vehicle_lookup_table('vehicle_manoeuvre_veh_lookup_table') }}
)

SELECT * FROM vehicle_manoeuvre;

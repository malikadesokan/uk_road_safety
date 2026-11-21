WITH vehicle_manoeuvre_historic AS (
    {{ get_vehicle_lookup_table('vehicle_manoeuvre_historic_veh_lookup_table') }}
)

SELECT * FROM vehicle_manoeuvre_historic;

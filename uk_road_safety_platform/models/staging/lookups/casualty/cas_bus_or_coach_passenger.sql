WITH bus_or_coach_passenger AS (
    {{ get_casualty_table('bus_or_coach_passenger_cas_lookup_table') }}
)

SELECT * FROM bus_or_coach_passenger;

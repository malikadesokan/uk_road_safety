WITH car_passenger AS (
    {{ get_casualty_table('car_passenger_cas_lookup_table') }}
)

SELECT * FROM car_passenger;

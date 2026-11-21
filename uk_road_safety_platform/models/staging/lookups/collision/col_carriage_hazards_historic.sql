WITH carriage_hazards_historic AS (
    {{ get_lookup_table('carriage_hazards_historic_col_lookup_table') }}
)

SELECT * FROM carriage_hazards_historic;

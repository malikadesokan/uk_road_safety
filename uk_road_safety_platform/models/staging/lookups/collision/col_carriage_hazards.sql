WITH carriage_hazards AS (
    {{ get_lookup_table('carriage_hazards_col_lookup_table') }}
)

SELECT * FROM carriage_hazards;

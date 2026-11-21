WITH sex_of_casualty AS (
    {{ get_casualty_table('sex_of_casualty_cas_lookup_table') }}
)

SELECT * FROM sex_of_casualty;

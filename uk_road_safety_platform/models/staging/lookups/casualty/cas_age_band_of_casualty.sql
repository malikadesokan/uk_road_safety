WITH age_band_of_casualty AS (
    {{ get_casualty_table('age_band_of_casualty_cas_lookup_table') }}
)

SELECT * FROM age_band_of_casualty;

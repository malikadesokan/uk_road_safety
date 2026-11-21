WITH casualty_injury_based AS (
    {{ get_casualty_table('casualty_injury_based_cas_lookup_table') }}
)

SELECT * FROM casualty_injury_based;

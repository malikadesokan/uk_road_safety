WITH casualty_type AS (
    {{ get_casualty_table('casualty_type_cas_lookup_table') }}
)

SELECT * FROM casualty_type;

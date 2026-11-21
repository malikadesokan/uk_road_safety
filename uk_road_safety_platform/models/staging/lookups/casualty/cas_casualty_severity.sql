WITH casualty_severity AS (
    {{ get_casualty_table('casualty_severity_cas_lookup_table') }}
)

SELECT * FROM casualty_severity;

WITH enhanced_casualty_severity AS (
    {{ get_casualty_table('enhanced_casualty_severity_cas_lookup_table') }}
)

SELECT * FROM enhanced_casualty_severity;

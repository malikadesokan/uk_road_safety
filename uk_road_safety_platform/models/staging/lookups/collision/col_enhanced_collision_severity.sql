WITH enhanced_collision_severity AS (
    {{ get_lookup_table('enhanced_collision_severity_col_lookup_table') }}
)

SELECT * FROM enhanced_collision_severity;

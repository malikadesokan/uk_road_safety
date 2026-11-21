WITH collision_severity AS (
    {{ get_lookup_table('collision_severity_col_lookup_table') }}
)

SELECT * FROM collision_severity;

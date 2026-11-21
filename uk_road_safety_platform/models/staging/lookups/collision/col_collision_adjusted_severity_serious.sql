WITH collision_adjusted_severity_serious AS (
    {{ get_lookup_table('collision_adjusted_severity_serious_col_lookup_table') }}
)

SELECT * FROM collision_adjusted_severity_serious;

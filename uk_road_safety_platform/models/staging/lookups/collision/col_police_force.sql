WITH police_force AS (
    {{ get_lookup_table('police_force_col_lookup_table') }}
)

SELECT * FROM police_force;

WITH junction_control AS (
    {{ get_lookup_table('junction_control_col_lookup_table') }}
)

SELECT * FROM junction_control;

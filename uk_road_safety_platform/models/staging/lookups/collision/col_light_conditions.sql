WITH light_conditions AS (
    {{ get_lookup_table('light_conditions_col_lookup_table') }}
)

SELECT * FROM light_conditions;

WITH special_condition_at_site AS (
    {{ get_lookup_table('special_condition_at_site_col_lookup_table') }}
)

SELECT * FROM special_condition_at_site;

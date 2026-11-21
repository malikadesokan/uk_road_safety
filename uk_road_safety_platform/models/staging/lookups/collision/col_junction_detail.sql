WITH junction_detail AS (
    {{ get_lookup_table('junction_detail_col_lookup_table') }}
)

SELECT * FROM junction_detail;

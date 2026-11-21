WITH junction_detail_historic AS (
    {{ get_lookup_table('junction_detail_historic_col_lookup_table') }}
)

SELECT * FROM junction_detail_historic;

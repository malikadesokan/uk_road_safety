WITH urban_or_rural_area AS (
    {{ get_lookup_table('urban_or_rural_area_col_lookup_table') }}
)

SELECT * FROM urban_or_rural_area;

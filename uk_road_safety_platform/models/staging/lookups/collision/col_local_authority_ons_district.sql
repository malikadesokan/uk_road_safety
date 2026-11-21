WITH local_authority_ons_district AS (
    {{ get_lookup_table('local_authority_ons_district_col_lookup_table') }}
)

SELECT * FROM local_authority_ons_district;

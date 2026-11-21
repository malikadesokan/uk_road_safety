WITH local_authority_district AS (
    {{ get_lookup_table('local_authority_district_col_lookup_table') }}
)

SELECT * FROM local_authority_district;

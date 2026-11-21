WITH casualty_distance_banding AS (
    {{ get_casualty_table('casualty_distance_banding_cas_lookup_table') }}
)

SELECT * FROM casualty_distance_banding;

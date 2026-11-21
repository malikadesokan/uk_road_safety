WITH casualty_imd_decile AS (
    {{ get_casualty_table('casualty_imd_decile_cas_lookup_table') }}
)

SELECT * FROM casualty_imd_decile;

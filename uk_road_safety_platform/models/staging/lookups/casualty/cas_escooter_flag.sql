WITH escooter_flag AS (
    {{ get_casualty_table('escooter_flag_cas_lookup_table') }}
)

SELECT * FROM escooter_flag;

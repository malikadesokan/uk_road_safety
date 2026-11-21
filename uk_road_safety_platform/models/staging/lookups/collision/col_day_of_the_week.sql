WITH day_of_the_week AS (
    {{ get_lookup_table('day_of_the_week_col_lookup_table') }}
)

SELECT * FROM day_of_the_week;

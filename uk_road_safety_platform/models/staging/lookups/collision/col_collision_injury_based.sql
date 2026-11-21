WITH collision_injury_based AS (
    {{ get_lookup_table('collision_injury_based_col_lookup_table') }}
)

SELECT * FROM collision_injury_based;

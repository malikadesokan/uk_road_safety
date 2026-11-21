WITH did_police_officer_attend_scene_of_accident AS (
    {{ get_lookup_table('did_police_officer_attend_scene_of_accident_col_lookup_table') }}
)

SELECT * FROM did_police_officer_attend_scene_of_accident;

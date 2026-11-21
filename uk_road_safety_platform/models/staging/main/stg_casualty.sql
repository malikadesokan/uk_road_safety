WITH casualty_data AS (
    SELECT * FROM {{ source('DfT', 'casualties_data') }}
),

cleaned AS(
    SELECT 
        CAST(collision_index AS STRING) AS collision_index,
        CAST(collision_year AS STRING) AS collision_year,
        CAST(collision_ref_no AS STRING) AS collision_ref_no,
        CAST(vehicle_reference AS STRING) AS vehicle_ref,
        CAST(casualty_reference AS STRING) AS casualty_ref,
        CAST(casualty_class AS INT64) AS casualty_class,
        CAST(sex_of_casualty AS INT64) AS gender,
        CAST(age_of_casualty AS INT64) AS age,
        CAST(age_band_of_casualty AS INT64) AS age_band,
        CAST(casualty_severity AS INT64) AS casualty_severity,
        CAST(pedestrian_location AS INT64) AS pedestrian_location,
        CAST(pedestrian_movement AS INT64) AS pedestrian_movement,
        CAST(car_passenger AS INT64) AS car_passenger,
        CAST(bus_or_coach_passenger AS INT64) AS bus_coach_passenger,
        CAST(pedestrian_road_maintenance_worker AS INT64) AS maintenance_worker,
        CAST(casualty_type AS INT64) AS casualty_type,
        CAST(casualty_imd_decile AS INT64) AS casualty_imd_decile,
        CAST(lsoa_of_casualty AS STRING) AS lsoa_of_casualty,
        CAST(enhanced_casualty_severity AS INT64) AS enhanced_casualty_severity,
        CAST(casualty_injury_based AS INT64) AS casualty_injury_based,
        CAST(casualty_adjusted_severity_serious AS NUMERIC) AS casualty_adjusted_severity_serious,
        CAST(casualty_adjusted_severity_slight AS NUMERIC) AS casualty_adjusted_severity_slight,
        CAST(casualty_distance_banding AS INT64) AS casualty_distance_banding,
        CAST(escooter_flag AS INT64) AS escooter_flag
    FROM casualty_data
)

SELECT * FROM cleaned
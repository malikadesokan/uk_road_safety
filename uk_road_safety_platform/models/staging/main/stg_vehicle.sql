WITH vehicle_data AS (
    SELECT * FROM {{ source('DfT','vehicle_data') }}
),

cleaned AS(
    SELECT 
    CAST(collision_index AS STRING) AS collision_index,
    CAST(collision_year AS STRING) AS collision_year,
    CAST(collision_ref_no AS STRING) AS collision_ref_no,
    CAST(vehicle_reference AS STRING) AS vehicle_ref_no,
    CAST(vehicle_type AS STRING) AS vehicle_type,
    CAST(towing_and_articulation AS INT64) AS tow_and_articulation,
    CAST(vehicle_manoeuvre_historic AS INT64) AS historic_vehicle_manoeuvre,
    CAST(vehicle_manoeuvre AS INT64) AS vehicle_manoeuvre,
    CAST(vehicle_direction_from AS INT64) AS direction_from,
    CAST(vehicle_direction_to AS INT64) AS direction_to,
    CAST(vehicle_location_restricted_lane_historic AS INT64) AS historic_vehicle_location_restricted_lane,
    CAST(vehicle_location_restricted_lane AS INT64) AS vehicle_location_restricted_lane,
    CAST(junction_location AS INT64) AS junction_location,
    CAST(skidding_and_overturning AS INT64) AS skidding_overturning,
    CAST(hit_object_in_carriageway AS INT64) AS hit_object_in_carriageway,
    CAST(vehicle_leaving_carriageway AS INT64) AS vehicle_leaving_carriageway,
    CAST(hit_object_off_carriageway AS INT64) AS hit_object_off_carriageway,
    CAST(first_point_of_impact AS INT64) AS first_point_of_impact,
    CAST(vehicle_left_hand_drive AS INT64) AS left_hand_vehicle,
    CAST(journey_purpose_of_driver_historic AS INT64) AS historic_journey_purpose,
    CAST(journey_purpose_of_driver AS INT64) AS journey_purpose,
    CAST(sex_of_driver AS INT64) AS driver_gender,
    CAST(age_of_driver AS INT64) AS driver_age,
    CAST(age_band_of_driver AS INT64) AS driver_age_band,
    CAST(engine_capacity_cc AS INT64) AS engine_capacity,
    CAST(propulsion_code AS INT64) AS propulsion_code,
    CAST(age_of_vehicle AS INT64) AS vehicle_age,
    CAST(generic_make_model AS STRING) AS vehicle_model,
    CAST(driver_imd_decile AS INT) AS driver_imd_decile,
    CAST(lsoa_of_driver AS STRING) AS driver_lsoa,
    CAST(escooter_flag AS INT64) AS escooter_flag,
    CAST(driver_distance_banding AS INT64) AS distance_banding

    FROM vehicle_data

)

SELECT * FROM cleaned
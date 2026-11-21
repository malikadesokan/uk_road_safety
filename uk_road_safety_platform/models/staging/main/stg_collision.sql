WITH collision AS (
    SELECT * FROM {{ source('DfT', 'collision_data') }}
),

/* 
Lookup Tables
*/


cleaned AS(
    SELECT
    CAST(collision_index AS STRING) AS collision_index,
    CAST(collision_year AS STRING) AS collision_year,
    CAST(collision_ref_no AS STRING) AS collision_ref_no,
    CAST(location_easting_osgr AS INT64) AS location_easting_osgr,
    CAST(location_northing_osgr AS INT64) AS location_northing_osgr,
    CAST(longitude AS NUMERIC) AS longitude,
    CAST(latitude AS NUMERIC) AS latitude,
    CAST(police_force AS STRING) AS police_force,
    CAST(collision_severity AS INT64) AS collision_severity,
    CAST(number_of_vehicles AS INT64) AS no_of_vehicles,
    CAST(number_of_casualties AS INT64) AS no_of_casualties,
    CAST(date AS DATE) AS collision_date,
    CAST(day_of_week AS INT64) AS weekday,
    CAST(time as STRING) AS collision_time,
    CAST(local_authority_district AS STRING) AS local_authority_district,
    CAST(local_authority_ons_district AS STRING) AS local_authority_ons_district,
    CAST(local_authority_highway AS STRING) AS local_authority_highway,
    CAST(local_authority_highway_current AS STRING) AS local_authority_highway_current,
    CAST(first_road_class AS INT64) AS first_road_class,
    CAST(first_road_number AS INT64) AS first_road_number,
    CAST(road_type AS INT64) AS road_type,
    CAST(speed_limit AS INT64) AS speed_limit,
    CAST(junction_detail_historic AS INT64) AS junction_detail_historic,
    CAST(junction_detail AS INT64) AS junction_detail,
    CAST(junction_control AS INT64) AS junction_control,
    CAST(second_road_class AS INT64) AS second_road_class,
    CAST(second_road_number AS INT64) AS second_road_number,
    CAST(pedestrian_crossing_human_control_historic AS INT64) AS pedestrian_crossing_human_control_historic,
    CAST(pedestrian_crossing_physical_facilities_historic AS INT64) AS pedestrian_crossing_physical_facilities_historic,
    CAST(pedestrian_crossing AS INT64) AS pedestrian_crossing,
    CAST(light_conditions AS INT64) AS light_conditions,
    CAST(weather_conditions AS INT64) AS weather_conditions,
    CAST(road_surface_conditions AS INT64) AS road_surface_conditions,
    CAST(special_conditions_at_site AS INT64) AS special_conditions_at_site,
    CAST(carriageway_hazards_historic AS INT64) AS carriageway_hazards_historic,
    CAST(carriageway_hazards AS INT64) AS carriageway_hazards,
    CAST(urban_or_rural_area AS INT64) AS urban_or_rural_area,
    CAST(did_police_officer_attend_scene_of_accident AS INT64) AS did_police_officer_attend_scene_of_accident,
    CAST(trunk_road_flag AS INT64) AS trunk_road_flag,
    CAST(lsoa_of_accident_location AS STRING) AS lsoa_of_accident_location,
    CAST(enhanced_severity_collision AS INT64) AS enhanced_severity_collision,
    CAST(collision_injury_based AS INT64) AS collision_injury_based,
    CAST(collision_adjusted_severity_serious AS INT64) AS collision_adjusted_severity_serious,
    CAST(collision_adjusted_severity_slight AS INT64) AS collision_adjusted_severity_slight
    FROM collision
    
)


SELECT * FROM cleaned
# DfT vehicle dataset data dictionary

Status: Draft for review. Related issue: #2. Prepared: 2026-11-07.

## Scope and sources

This document describes the supplied `dft-road-casualty-statistics-vehicle-last-5-years.csv`: 32 columns, 937,265 vehicle records and 513,801 distinct collision identifiers for 2021–2025. Counts describe this copy, not every DfT release.

Official definitions, code labels and specification notes were extracted from the supplied `dft-road-casualty-statistics-road-safety-open-dataset-data-guide-2025 (1).xlsx`, sheets `2024_code_list` (vehicle rows) and `2011_to_2024_conversion` (vehicle rows). Field explanations below are plain-language summaries. Code labels and notes reproduce the supplied guide, including its spelling.

DfT source page: https://www.gov.uk/government/statistical-data-sets/road-safety-open-data

The filename refers to 2025 but the code-list sheet is named `2024_code_list`. Specification year and collision year are different concepts. The guide includes historical codes outside this file’s period; their notes are retained below.

## Records by year

| Collision year | Vehicle records |
| --- | ---: |
| 2021 | 186,443 |
| 2022 | 193,545 |
| 2023 | 189,815 |
| 2024 | 183,514 |
| 2025 | 183,948 |

## Record grain and relationships

- A row is a vehicle record associated with a collision, not a count of people or casualties.
- `collision_index` identifies the collision and combines year and reference. There are 513,801 distinct values in this vehicle file.
- `vehicle_reference` identifies a vehicle within one collision. The pair (`collision_index`, `vehicle_reference`) has zero duplicate occurrences in the supplied file.
- `collision_ref_no` is an in-year police reference. Do not use it alone to join across years. Preserve identifier columns as text so leading zeros remain intact.
- To attach collision details, join vehicle records to collision records on `collision_index`. Expected relationship: many vehicles to one collision. Check uniqueness in the collision file before joining.
- To attach vehicle details to casualties, use `collision_index` AND `vehicle_reference` where the casualty record identifies a vehicle. Joining on collision alone can attach unrelated vehicles and multiply rows.
- Collision and casualty files were not supplied for this analysis. Cross-file key matches, unmatched casualty references and actual join cardinalities remain untested.

## Field dictionary

All 32 fields occur in this combined 2021–2025 file. Presence of a column does not establish availability of useful values in every year. Data types below are recommended logical types; a CSV stores text representations.

| Field | Meaning | Logical type | Values and missing-data reference |
| --- | --- | --- | --- |
| `collision_index` | Collision identifier combining year and police reference. | Text identifier | See field detail below. |
| `collision_year` | Year of the collision. | Integer year | See field detail below. |
| `collision_ref_no` | Police collision reference within a year; not unique across years. | Text identifier | See field detail below. |
| `vehicle_reference` | Vehicle identifier within a collision. | Integer identifier | See field detail below. |
| `vehicle_type` | Type of vehicle involved. | Integer category | See field detail below. |
| `towing_and_articulation` | Whether and what the vehicle was towing, or its articulation. | Integer category | See field detail below. |
| `vehicle_manoeuvre_historic` | Vehicle manoeuvre under the 2011 or earlier specification. | Integer category | See field detail below. |
| `vehicle_manoeuvre` | Vehicle manoeuvre collected in or converted to the 2024 specification. | Integer category | See field detail below. |
| `vehicle_direction_from` | Compass direction from which the vehicle was travelling. | Integer category | See field detail below. |
| `vehicle_direction_to` | Compass direction towards which the vehicle was travelling. | Integer category | See field detail below. |
| `vehicle_location_restricted_lane_historic` | Vehicle location under the 2011 or earlier restricted-lane specification. | Integer category | See field detail below. |
| `vehicle_location_restricted_lane` | Vehicle location collected in or converted to the 2024 restricted-lane specification. | Integer category | See field detail below. |
| `junction_location` | Vehicle position relative to a junction. | Integer category | See field detail below. |
| `skidding_and_overturning` | Whether the vehicle skidded, jackknifed or overturned. | Integer category | See field detail below. |
| `hit_object_in_carriageway` | Object hit within the carriageway. | Integer category | See field detail below. |
| `vehicle_leaving_carriageway` | Whether and how the vehicle left the carriageway. | Integer category | See field detail below. |
| `hit_object_off_carriageway` | Object or feature encountered off the carriageway. | Integer category | See field detail below. |
| `first_point_of_impact` | Part of the vehicle first impacted, or no impact. | Integer category | See field detail below. |
| `vehicle_left_hand_drive` | Whether the vehicle was left-hand drive. | Integer category | See field detail below. |
| `journey_purpose_of_driver_historic` | Driver journey purpose under the 2011 or earlier specification. | Integer category | See field detail below. |
| `journey_purpose_of_driver` | Driver journey purpose collected in or converted to the 2024 specification. | Integer category | See field detail below. |
| `sex_of_driver` | Recorded sex of driver. | Integer category | See field detail below. |
| `age_of_driver` | Driver age in years. | Integer measurement | See field detail below. |
| `age_band_of_driver` | Age group of the driver. | Integer category | See field detail below. |
| `engine_capacity_cc` | Engine capacity in cubic centimetres. | Integer measurement | See field detail below. |
| `propulsion_code` | Vehicle propulsion or fuel classification. | Integer category | See field detail below. |
| `age_of_vehicle` | Age of vehicle in years; interpretation of sentinel values requires further guidance. | Integer measurement | See field detail below. |
| `generic_make_model` | Generic vehicle make and model. | Text | See field detail below. |
| `driver_imd_decile` | Driver area deprivation decile; this is an area measure, not an individual income measure. | Integer ordered category | See field detail below. |
| `lsoa_of_driver` | Lower-layer Super Output Area associated with the driver; guide limits this field to England and Wales. | Text geography identifier | See field detail below. |
| `escooter_flag` | Whether the vehicle was an e-scooter. | Integer flag | See field detail below. |
| `driver_distance_banding` | Band for distance between collision and driver home postcode. | Integer ordered category | See field detail below. |

## Field details and complete guide code lists

Each detail includes every vehicle code/format entry for that field in the supplied guide. Observed counts come from the CSV. A guide value may have zero observations. For measurements and text fields, the workbook does not provide an exhaustive range of valid real values.

### collision_index

Collision identifier combining year and police reference.

Logical type: Text identifier. Distinct observed values: 513,801. Empty cells: 0. Literal `-1` count: 0.

Guide note: unique value for each collision. The collision_index combines the collision_year and collision_ref_no to form a unique ID. It can be used to join to Vehicle and Casualty

### collision_year

Year of the collision.

Logical type: Integer year. Distinct observed values: 5. Empty cells: 0. Literal `-1` count: 0.

Observed values: 2021, 2022, 2023, 2024, 2025.

### collision_ref_no

Police collision reference within a year; not unique across years.

Logical type: Text identifier. Distinct observed values: 510,837. Empty cells: 0. Literal `-1` count: 0.

Guide note: In year id used by the police to reference a collision. It is not unique outside of the year, use collision_index for linking to other years

### vehicle_reference

Vehicle identifier within a collision.

Logical type: Integer identifier. Distinct observed values: 45. Empty cells: 0. Literal `-1` count: 0.

Guide note: unique value for each vehicle in a singular accident. Can be used to join a Casualty to a vehicle

### vehicle_type

Type of vehicle involved.

Logical type: Integer category. Distinct observed values: 23. Empty cells: 0. Literal `-1` count: 661.

| Guide code/format | Official label | Guide note | Observed count |
| --- | --- | --- | ---: |
| 1 | Pedal cycle |  | 81,486 |
| 2 | Motorcycle 50cc and under |  | 5,008 |
| 3 | Motorcycle 125cc and under | category introduced in 1999 specification | 44,795 |
| 4 | Motorcycle over 125cc and up to 500cc | category introduced in 2005 specification | 9,590 |
| 5 | Motorcycle over 500cc | category introduced in 2005 specification | 23,011 |
| 8 | Taxi/Private hire car | category introduced in 2005 specification | 15,362 |
| 9 | Car | category introduced in 2005 specification | 637,681 |
| 10 | Minibus (8 - 16 passenger seats) | category introduced in 1999 specification | 1,506 |
| 11 | Bus or coach (17 or more pass seats) |  | 15,100 |
| 16 | Ridden horse | category introduced in 1999 specification | 367 |
| 17 | Agricultural vehicle | category introduced in 1999 specification | 1,937 |
| 18 | Tram | category introduced in 1999 specification | 109 |
| 19 | Van / Goods 3.5 tonnes mgw or under |  | 60,309 |
| 20 | Goods over 3.5t. and under 7.5t | category introduced in 1999 specification | 4,046 |
| 21 | Goods 7.5 tonnes mgw and over | category introduced in 1999 specification | 13,247 |
| 22 | Mobility scooter | cateogry introduced in 2011 specification | 1,628 |
| 23 | Electric motorcycle | cateogry introduced in 2011 specification | 1,902 |
| 33 | Personal powered transporter | cateogry introduced in 2024 specification | 6,901 |
| 90 | Other vehicle | cateogry introduced in 2011 specification | 5,094 |
| 97 | Motorcycle - unknown cc | cateogry introduced in 2011 specification | 2,988 |
| 98 | Goods vehicle - unknown weight | cateogry introduced in 2011 specification | 3,920 |
| 99 | Unknown vehicle type (self rep only) | cateogry introduced in 2011 specification | 617 |
| 103 | Motorcycle - Scooter (1979-1998) | cateogory discontinued in 1999 specification | Not individually tabulated |
| 104 | Motorcycle (1979-1998) | cateogory discontinued in 1999 specification | Not individually tabulated |
| 105 | Motorcycle - Combination (1979-1998) | cateogory discontinued in 1999 specification | Not individually tabulated |
| 106 | Motorcycle over 125cc (1999-2004) | cateogory discontinued in 2005 specification | Not individually tabulated |
| 108 | Taxi (excluding private hire cars) (1979-2004) | cateogory discontinued in 2005 specification | Not individually tabulated |
| 109 | Car (including private hire cars) (1979-2004) | cateogory discontinued in 2005 specification | Not individually tabulated |
| 110 | Minibus/Motor caravan (1979-1998) | cateogory discontinued in 1999 specification | Not individually tabulated |
| 113 | Goods over 3.5 tonnes (1979-1998) | cateogory discontinued in 1999 specification | Not individually tabulated |
| -1 | Data missing or out of range |  | 661 |

### towing_and_articulation

Whether and what the vehicle was towing, or its articulation.

Logical type: Integer category. Distinct observed values: 8. Empty cells: 0. Literal `-1` count: 8,676.

| Guide code/format | Official label | Guide note | Observed count |
| --- | --- | --- | ---: |
| 0 | No tow/articulation |  | 893,863 |
| 1 | Articulated vehicle |  | 6,506 |
| 2 | Double or multiple trailer |  | 140 |
| 3 | Caravan |  | 697 |
| 4 | Single trailer |  | 3,350 |
| 5 | Other tow |  | 1,317 |
| 9 | unknown (self reported) |  | 22,716 |
| -1 | Data missing or out of range |  | 8,676 |

### vehicle_manoeuvre_historic

Vehicle manoeuvre under the 2011 or earlier specification.

Logical type: Integer category. Distinct observed values: 20. Empty cells: 0. Literal `-1` count: 278,182.

| Guide code/format | Official label | Guide note | Observed count |
| --- | --- | --- | ---: |
| 1 | Reversing | data collected in the 2011 STATS19 specification (or earlier) | 8,458 |
| 2 | Parked | data collected in the 2011 STATS19 specification (or earlier) | 28,470 |
| 3 | Waiting to go - held up | data collected in the 2011 STATS19 specification (or earlier) | 26,937 |
| 4 | Slowing or stopping | data collected in the 2011 STATS19 specification (or earlier) | 36,954 |
| 5 | Moving off | data collected in the 2011 STATS19 specification (or earlier) | 30,480 |
| 6 | U-turn | data collected in the 2011 STATS19 specification (or earlier) | 4,517 |
| 7 | Turning left | data collected in the 2011 STATS19 specification (or earlier) | 21,404 |
| 8 | Waiting to turn left | data collected in the 2011 STATS19 specification (or earlier) | 2,800 |
| 9 | Turning right | data collected in the 2011 STATS19 specification (or earlier) | 57,150 |
| 10 | Waiting to turn right | data collected in the 2011 STATS19 specification (or earlier) | 7,901 |
| 11 | Changing lane to left | data collected in the 2011 STATS19 specification (or earlier) | 4,824 |
| 12 | Changing lane to right | data collected in the 2011 STATS19 specification (or earlier) | 5,325 |
| 13 | Overtaking moving vehicle - offside | data collected in the 2011 STATS19 specification (or earlier) | 12,091 |
| 14 | Overtaking static vehicle - offside | data collected in the 2011 STATS19 specification (or earlier) | 6,195 |
| 15 | Overtaking - nearside | data collected in the 2011 STATS19 specification (or earlier) | 4,576 |
| 16 | Going ahead left-hand bend | data collected in the 2011 STATS19 specification (or earlier) | 16,753 |
| 17 | Going ahead right-hand bend | data collected in the 2011 STATS19 specification (or earlier) | 19,187 |
| 18 | Going ahead other | data collected in the 2011 STATS19 specification (or earlier) | 301,785 |
| 99 | unknown (self reported) | data collected in the 2011 STATS19 specification (or earlier) | 63,276 |
| -1 | Data missing or out of range | data collected in the 2011 STATS19 specification (or earlier) | 278,182 |

### vehicle_manoeuvre

Vehicle manoeuvre collected in or converted to the 2024 specification.

Logical type: Integer category. Distinct observed values: 19. Empty cells: 0. Literal `-1` count: 16,854.

| Guide code/format | Official label | Guide note | Observed count |
| --- | --- | --- | ---: |
| 1 | Reversing | New field added with the 2024 data - data collected in or converted to the 2024 STATS19 specification | 11,722 |
| 2 | Parked | New field added with the 2024 data - data collected in or converted to the 2024 STATS19 specification | 41,048 |
| 3 | Waiting to go ahead | New field added with the 2024 data - data collected in or converted to the 2024 STATS19 specification | 37,764 |
| 4 | Slowing or stopping | New field added with the 2024 data - data collected in or converted to the 2024 STATS19 specification | 51,403 |
| 5 | Moving off | New field added with the 2024 data - data collected in or converted to the 2024 STATS19 specification | 44,071 |
| 6 | U-turn | New field added with the 2024 data - data collected in or converted to the 2024 STATS19 specification | 6,180 |
| 7 | Turning left | New field added with the 2024 data - data collected in or converted to the 2024 STATS19 specification | 30,185 |
| 8 | Waiting to turn left | New field added with the 2024 data - data collected in or converted to the 2024 STATS19 specification | 4,086 |
| 9 | Turning right | New field added with the 2024 data - data collected in or converted to the 2024 STATS19 specification | 80,521 |
| 10 | Waiting to turn right | New field added with the 2024 data - data collected in or converted to the 2024 STATS19 specification | 11,214 |
| 11 | Changing lane to left | New field added with the 2024 data - data collected in or converted to the 2024 STATS19 specification | 6,969 |
| 12 | Changing lane to right | New field added with the 2024 data - data collected in or converted to the 2024 STATS19 specification | 7,838 |
| 13 | Over taking moving vehicle on its offside | New field added with the 2024 data - data collected in or converted to the 2024 STATS19 specification | 16,899 |
| 14 | Overtaking stationary vehicle on its offside | New field added with the 2024 data - data collected in or converted to the 2024 STATS19 specification | 8,385 |
| 15 | Overtaking on nearside (passengers side nearest kerb) | New field added with the 2024 data - data collected in or converted to the 2024 STATS19 specification | 6,515 |
| 19 | Going ahead | New field added with the 2024 data - data collected in or converted to the 2024 STATS19 specification | 480,128 |
| 20 | Parking | New field added with the 2024 data - data collected in or converted to the 2024 STATS19 specification | 582 |
| 99 | unknown (self reported) | New field added with the 2024 data - data collected in or converted to the 2024 STATS19 specification | 74,901 |
| -1 | Data missing or out of range | New field added with the 2024 data - data collected in or converted to the 2024 STATS19 specification | 16,854 |

### vehicle_direction_from

Compass direction from which the vehicle was travelling.

Logical type: Integer category. Distinct observed values: 11. Empty cells: 0. Literal `-1` count: 23,872.

| Guide code/format | Official label | Guide note | Observed count |
| --- | --- | --- | ---: |
| 0 | Parked | both vehicle_direction_from and vehicle_direction_to should be 0 | 38,121 |
| 1 | North |  | 142,532 |
| 2 | North East |  | 72,716 |
| 3 | East |  | 122,744 |
| 4 | South East |  | 69,099 |
| 5 | South |  | 134,089 |
| 6 | South West |  | 72,101 |
| 7 | West |  | 117,130 |
| 8 | North West |  | 68,111 |
| 9 | unknown (self reported) | both vehicle_direction_from and vehicle_direction_to should be 9 | 76,750 |
| -1 | Data missing or out of range |  | 23,872 |

### vehicle_direction_to

Compass direction towards which the vehicle was travelling.

Logical type: Integer category. Distinct observed values: 11. Empty cells: 0. Literal `-1` count: 24,022.

| Guide code/format | Official label | Guide note | Observed count |
| --- | --- | --- | ---: |
| 0 | Parked | both vehicle_direction_from and vehicle_direction_to should be 0 | 36,880 |
| 1 | North |  | 135,178 |
| 2 | North East |  | 76,491 |
| 3 | East |  | 120,406 |
| 4 | South East |  | 71,003 |
| 5 | South |  | 133,322 |
| 6 | South West |  | 73,168 |
| 7 | West |  | 120,913 |
| 8 | North West |  | 69,132 |
| 9 | unknown (self reported) | both vehicle_direction_from and vehicle_direction_to should be 9 | 76,750 |
| -1 | Data missing or out of range |  | 24,022 |

### vehicle_location_restricted_lane_historic

Vehicle location under the 2011 or earlier restricted-lane specification.

Logical type: Integer category. Distinct observed values: 12. Empty cells: 0. Literal `-1` count: 273,935.

| Guide code/format | Official label | Guide note | Observed count |
| --- | --- | --- | ---: |
| 0 | On main c'way - not in restricted lane | data collected in the 2011 STATS19 specification (or earlier) | 577,897 |
| 1 | Tram/Light rail track | data collected in the 2011 STATS19 specification (or earlier) | 734 |
| 2 | Bus lane | data collected in the 2011 STATS19 specification (or earlier) | 3,040 |
| 3 | Busway (including guided busway) | data collected in the 2011 STATS19 specification (or earlier) | 319 |
| 4 | Cycle lane (on main carriageway) | data collected in the 2011 STATS19 specification (or earlier) | 3,325 |
| 5 | Cycleway or shared use footway (not part of  main carriageway) | data collected in the 2011 STATS19 specification (or earlier) | 1,360 |
| 6 | On lay-by or hard shoulder | data collected in the 2011 STATS19 specification (or earlier) | 2,133 |
| 7 | Entering lay-by or hard shoulder | data collected in the 2011 STATS19 specification (or earlier) | 418 |
| 8 | Leaving lay-by or hard shoulder | data collected in the 2011 STATS19 specification (or earlier) | 780 |
| 9 | Footway (pavement) | data collected in the 2011 STATS19 specification (or earlier) | 10,819 |
| 10 | Not on carriageway | data collected in the 2011 STATS19 specification (or earlier) | Not individually tabulated |
| 99 | unknown (self reported) | data collected in the 2011 STATS19 specification (or earlier) | 62,505 |
| -1 | Data missing or out of range | data collected in the 2011 STATS19 specification (or earlier) | 273,935 |

### vehicle_location_restricted_lane

Vehicle location collected in or converted to the 2024 restricted-lane specification.

Logical type: Integer category. Distinct observed values: 9. Empty cells: 0. Literal `-1` count: 14,728.

| Guide code/format | Official label | Guide note | Observed count |
| --- | --- | --- | ---: |
| 0 | On main carriageway (not in restricted lane) | New field added with the 2024 data - data collected in or converted to the 2024 STATS19 specification | 813,461 |
| 1 | Tram or Light rail track | New field added with the 2024 data - data collected in or converted to the 2024 STATS19 specification | 1,036 |
| 2 | Bus lane or Busway | New field added with the 2024 data - data collected in or converted to the 2024 STATS19 specification | 4,491 |
| 4 | Cycle lane (on main carriageway) | New field added with the 2024 data - data collected in or converted to the 2024 STATS19 specification | 4,913 |
| 5 | Cycleway or shared use footway (not part of main carriageway) | New field added with the 2024 data - data collected in or converted to the 2024 STATS19 specification | 2,122 |
| 6 | Lay-by or hard shoulder | New field added with the 2024 data - data collected in or converted to the 2024 STATS19 specification | 4,875 |
| 9 | Footway (pavement) | New field added with the 2024 data - data collected in or converted to the 2024 STATS19 specification | 16,680 |
| 99 | unknown (self reported) | New field added with the 2024 data - data collected in or converted to the 2024 STATS19 specification | 74,959 |
| -1 | Data missing or out of range | New field added with the 2024 data - data collected in or converted to the 2024 STATS19 specification | 14,728 |

### junction_location

Vehicle position relative to a junction.

Logical type: Integer category. Distinct observed values: 11. Empty cells: 0. Literal `-1` count: 6,368.

| Guide code/format | Official label | Guide note | Observed count |
| --- | --- | --- | ---: |
| 0 | Not at or within 20 metres of junction |  | 381,968 |
| 1 | Approaching junction or waiting/parked at junction approach |  | 199,448 |
| 2 | Cleared junction or waiting/parked at junction exit |  | 48,848 |
| 3 | Leaving roundabout |  | 15,360 |
| 4 | Entering roundabout |  | 26,317 |
| 5 | Leaving main road |  | 21,955 |
| 6 | Entering main road |  | 39,356 |
| 7 | Entering from slip road |  | 2,484 |
| 8 | Mid Junction - on roundabout or on main road |  | 135,263 |
| 9 | unknown (self reported) |  | 59,898 |
| -1 | Data missing or out of range |  | 6,368 |

### skidding_and_overturning

Whether the vehicle skidded, jackknifed or overturned.

Logical type: Integer category. Distinct observed values: 8. Empty cells: 0. Literal `-1` count: 14,866.

| Guide code/format | Official label | Guide note | Observed count |
| --- | --- | --- | ---: |
| 0 | None |  | 752,015 |
| 1 | Skidded |  | 52,619 |
| 2 | Skidded and overturned |  | 15,784 |
| 3 | Jackknifed |  | 210 |
| 4 | Jackknifed and overturned |  | 101 |
| 5 | Overturned |  | 25,046 |
| 9 | unknown (self reported) |  | 76,624 |
| -1 | Data missing or out of range |  | 14,866 |

### hit_object_in_carriageway

Object hit within the carriageway.

Logical type: Integer category. Distinct observed values: 14. Empty cells: 0. Literal `-1` count: 12,499.

| Guide code/format | Official label | Guide note | Observed count |
| --- | --- | --- | ---: |
| 0 | None |  | 800,902 |
| 1 | Previous accident |  | 829 |
| 2 | Road works |  | 540 |
| 4 | Parked vehicle |  | 18,421 |
| 5 | Bridge (roof) |  | 98 |
| 6 | Bridge (side) |  | 605 |
| 7 | Bollard or refuge |  | 4,914 |
| 8 | Open door of vehicle |  | 1,516 |
| 9 | Central island of roundabout |  | 1,087 |
| 10 | Kerb |  | 13,452 |
| 11 | Other object |  | 4,800 |
| 12 | Any animal (except ridden horse) |  | 1,201 |
| 99 | unknown (self reported) |  | 76,401 |
| -1 | Data missing or out of range |  | 12,499 |

### vehicle_leaving_carriageway

Whether and how the vehicle left the carriageway.

Logical type: Integer category. Distinct observed values: 11. Empty cells: 0. Literal `-1` count: 14,851.

| Guide code/format | Official label | Guide note | Observed count |
| --- | --- | --- | ---: |
| 0 | Did not leave carriageway |  | 751,137 |
| 1 | Nearside |  | 51,068 |
| 2 | Nearside and rebounded |  | 5,824 |
| 3 | Straight ahead at junction |  | 5,552 |
| 4 | Offside on to central reservation |  | 2,713 |
| 5 | Offside on to centrl res + rebounded |  | 1,632 |
| 6 | Offside - crossed central reservation |  | 948 |
| 7 | Offside |  | 25,530 |
| 8 | Offside and rebounded |  | 2,979 |
| 9 | unknown (self reported) |  | 75,031 |
| -1 | Data missing or out of range |  | 14,851 |

### hit_object_off_carriageway

Object or feature encountered off the carriageway.

Logical type: Integer category. Distinct observed values: 14. Empty cells: 0. Literal `-1` count: 4,881.

| Guide code/format | Official label | Guide note | Observed count |
| --- | --- | --- | ---: |
| 0 | None |  | 804,382 |
| 1 | Road sign or traffic signal |  | 5,216 |
| 2 | Lamp post |  | 4,199 |
| 3 | Telegraph or electricity pole |  | 1,801 |
| 4 | Tree |  | 10,032 |
| 5 | Bus stop or bus shelter |  | 382 |
| 6 | Central crash barrier |  | 2,694 |
| 7 | Near/Offside crash barrier |  | 3,092 |
| 8 | Submerged in water |  | 60 |
| 9 | Entered ditch |  | 5,154 |
| 10 | Other permanent object |  | 9,094 |
| 11 | Wall or fence |  | 11,721 |
| 99 | unknown (self reported) |  | 74,557 |
| -1 | Data missing or out of range |  | 4,881 |

### first_point_of_impact

Part of the vehicle first impacted, or no impact.

Logical type: Integer category. Distinct observed values: 7. Empty cells: 0. Literal `-1` count: 14,595.

| Guide code/format | Official label | Guide note | Observed count |
| --- | --- | --- | ---: |
| 0 | Did not impact |  | 43,037 |
| 1 | Front |  | 461,435 |
| 2 | Back |  | 144,700 |
| 3 | Offside |  | 124,590 |
| 4 | Nearside |  | 110,970 |
| 9 | unknown (self reported) |  | 37,938 |
| -1 | Data missing or out of range |  | 14,595 |

### vehicle_left_hand_drive

Whether the vehicle was left-hand drive.

Logical type: Integer category. Distinct observed values: 4. Empty cells: 0. Literal `-1` count: 259.

| Guide code/format | Official label | Guide note | Observed count |
| --- | --- | --- | ---: |
| 1 | No |  | 852,133 |
| 2 | Yes |  | 10,097 |
| 9 | Unknown |  | 74,776 |
| -1 | Data missing or out of range |  | 259 |

### journey_purpose_of_driver_historic

Driver journey purpose under the 2011 or earlier specification.

Logical type: Integer category. Distinct observed values: 7. Empty cells: 0. Literal `-1` count: 270,786.

| Guide code/format | Official label | Guide note | Observed count |
| --- | --- | --- | ---: |
| 1 | Journey as part of work | data collected in the 2011 STATS19 specification (or earlier) | 91,506 |
| 2 | Commuting to/from work | data collected in the 2011 STATS19 specification (or earlier) | 69,323 |
| 3 | Taking pupil to/from school | data collected in the 2011 STATS19 specification (or earlier) | 7,447 |
| 4 | Pupil riding to/from school | data collected in the 2011 STATS19 specification (or earlier) | 2,491 |
| 5 | Other | data collected in the 2011 STATS19 specification (or earlier) | 101,238 |
| 6 | Not known | data collected in the 2011 STATS19 specification (or earlier) | 394,474 |
| 15 | Other/Not known | 2005 specification only | Not individually tabulated |
| -1 | Data missing or out of range | data collected in the 2011 STATS19 specification (or earlier) | 270,786 |

### journey_purpose_of_driver

Driver journey purpose collected in or converted to the 2024 specification.

Logical type: Integer category. Distinct observed values: 7. Empty cells: 0. Literal `-1` count: 6,038.

| Guide code/format | Official label | Guide note | Observed count |
| --- | --- | --- | ---: |
| 1 | Journey as part of work | New field added with the 2024 data - data collected in or converted to the 2024 STATS19 specification | 125,077 |
| 2 | Commuting to or from work | New field added with the 2024 data - data collected in or converted to the 2024 STATS19 specification | 97,574 |
| 6 | Not known or not requested | New field added with the 2024 data - data collected in or converted to the 2024 STATS19 specification | 620,060 |
| 7 | Education and educational escort | New field added with the 2024 data - data collected in or converted to the 2024 STATS19 specification | 13,094 |
| 8 | Emergency vehicle (blue light) on response | New field added with the 2024 data - data collected in or converted to the 2024 STATS19 specification | 871 |
| 9 | Personal business or leisure | New field added with the 2024 data - data collected in or converted to the 2024 STATS19 specification | 74,551 |
| -1 | Data missing or out of range | New field added with the 2024 data - data collected in or converted to the 2024 STATS19 specification | 6,038 |

### sex_of_driver

Recorded sex of driver.

Logical type: Integer category. Distinct observed values: 4. Empty cells: 0. Literal `-1` count: 7,845.

| Guide code/format | Official label | Guide note | Observed count |
| --- | --- | --- | ---: |
| 1 | Male |  | 575,771 |
| 2 | Female |  | 239,124 |
| 3 | Not known |  | 114,525 |
| -1 | Data missing or out of range |  | 7,845 |

### age_of_driver

Driver age in years.

Logical type: Integer measurement. Distinct observed values: 103. Empty cells: 0. Literal `-1` count: 142,240.

| Guide code/format | Official label | Guide note | Observed count |
| --- | --- | --- | ---: |
| -1 | Data missing or out of range |  | 142,240 |

### age_band_of_driver

Age group of the driver.

Logical type: Integer category. Distinct observed values: 12. Empty cells: 0. Literal `-1` count: 142,240.

| Guide code/format | Official label | Guide note | Observed count |
| --- | --- | --- | ---: |
| 1 | 0 - 5 |  | 198 |
| 2 | 6 - 10 |  | 1,724 |
| 3 | 11 - 15 |  | 8,406 |
| 4 | 16 - 20 |  | 62,478 |
| 5 | 21 - 25 |  | 86,615 |
| 6 | 26 - 35 |  | 187,204 |
| 7 | 36 - 45 |  | 154,262 |
| 8 | 46 - 55 |  | 125,729 |
| 9 | 56 - 65 |  | 94,930 |
| 10 | 66 - 75 |  | 43,084 |
| 11 | Over 75 |  | 30,395 |
| -1 | Data missing or out of range |  | 142,240 |

### engine_capacity_cc

Engine capacity in cubic centimetres.

Logical type: Integer measurement. Distinct observed values: 1,523. Empty cells: 0. Literal `-1` count: 234,989.

| Guide code/format | Official label | Guide note | Observed count |
| --- | --- | --- | ---: |
| -1 | Data missing or out of range |  | 234,989 |

### propulsion_code

Vehicle propulsion or fuel classification.

Logical type: Integer category. Distinct observed values: 13. Empty cells: 0. Literal `-1` count: 218,032.

| Guide code/format | Official label | Guide note | Observed count |
| --- | --- | --- | ---: |
| 1 | Petrol |  | 379,547 |
| 2 | Heavy oil |  | 272,487 |
| 3 | Electric |  | 16,706 |
| 4 | Steam |  | 2 |
| 5 | Gas |  | 277 |
| 6 | Petrol/Gas (LPG) |  | 35 |
| 7 | Gas/Bi-fuel |  | 423 |
| 8 | Hybrid electric |  | 47,842 |
| 9 | Gas Diesel |  | 4 |
| 10 | New fuel technology |  | 5 |
| 11 | Fuel cells |  | 3 |
| 12 | Electric diesel |  | 1,902 |
| -1 | Undefined |  | 218,032 |

### age_of_vehicle

Age of vehicle in years; interpretation of sentinel values requires further guidance.

Logical type: Integer measurement. Distinct observed values: 99. Empty cells: 0. Literal `-1` count: 363,287.

The guide supplies no explicit sentinel definition for this field. `-1` is observed and should be excluded from age calculations pending confirmation. Every 2025 value is `-1`; do not calculate a 2025 average vehicle age from this file. Non-negative observed ages extend to 123 years; investigate extreme values before analysis, without assuming they are errors.

### generic_make_model

Generic vehicle make and model.

Logical type: Text. Distinct observed values: 958. Empty cells: 0. Literal `-1` count: 227,368.

| Guide code/format | Official label | Guide note | Observed count |
| --- | --- | --- | ---: |
| -1 | Data missing or out of range | field introduced in 2020 | 227,368 |

Guide note: field introduced in 2020

### driver_imd_decile

Driver area deprivation decile; this is an area measure, not an individual income measure.

Logical type: Integer ordered category. Distinct observed values: 11. Empty cells: 0. Literal `-1` count: 199,518.

| Guide code/format | Official label | Guide note | Observed count |
| --- | --- | --- | ---: |
| 1 | Most deprived 10% | field introduced in 2016 | 83,416 |
| 2 | More deprived 10-20% | field introduced in 2016 | 88,456 |
| 3 | More deprived 20-30% | field introduced in 2016 | 86,071 |
| 4 | More deprived 30-40% | field introduced in 2016 | 82,244 |
| 5 | More deprived 40-50% | field introduced in 2016 | 78,645 |
| 6 | Less deprived 40-50% | field introduced in 2016 | 74,458 |
| 7 | Less deprived 30-40% | field introduced in 2016 | 67,923 |
| 8 | Less deprived 20-30% | field introduced in 2016 | 64,777 |
| 9 | Less deprived 10-20% | field introduced in 2016 | 59,498 |
| 10 | Least deprived 10% | field introduced in 2016 | 52,259 |
| -1 | Data missing or out of range | field introduced in 2016 | 199,518 |

Use as an ordered area-level deprivation category. The supplied workbook does not explain index geography/version comparability in detail; verify this before comparing areas or years.

### lsoa_of_driver

Lower-layer Super Output Area associated with the driver; guide limits this field to England and Wales.

Logical type: Text geography identifier. Distinct observed values: 36,673. Empty cells: 0. Literal `-1` count: 228,064.

Guide note: England and Wales only. See Office for National Statistics (ONS) guidance: https://www.ons.gov.uk/methodology/geography/ukgeographies/censusgeography

The CSV contains 228,064 literal `-1` values. This field’s guide row does not define that marker; treat it as an unavailable geography pending confirmation, not as an ONS area code.

### escooter_flag

Whether the vehicle was an e-scooter.

Logical type: Integer flag. Distinct observed values: 2. Empty cells: 0. Literal `-1` count: 0.

| Guide code/format | Official label | Guide note | Observed count |
| --- | --- | --- | ---: |
| 1 | Vehicle was an e-scooter | field introduced in 2023 | 6,786 |
| 0 | Vehicle was not an e-scooter | field introduced in 2023 | 930,479 |

### driver_distance_banding

Band for distance between collision and driver home postcode.

Logical type: Integer ordered category. Distinct observed values: 6. Empty cells: 0. Literal `-1` count: 651,858.

| Guide code/format | Official label | Guide note | Observed count |
| --- | --- | --- | ---: |
| 1 | Collision occurred within 5km of drivers home postcode | field introduced in 2023 | 149,742 |
| 2 | Collision occurred between 5.001 and 10km of drivers home postcode | field introduced in 2023 | 47,376 |
| 3 | Collision occurred between 10.001 and 20km of drivers home postcode | field introduced in 2023 | 38,030 |
| 4 | Collision occurred between 20.001 and 100km of drivers home postcode | field introduced in 2023 | 39,404 |
| 5 | Collision occurred over 100km of drivers home postcode | field introduced in 2023 | 10,855 |
| -1 | Not stated in guide | field introduced in 2023 | 651,858 |

The guide lists `-1` without a label. The CSV has `-1` for every 2021, 2022 and 2023 record. Record this as unavailable in this copy; do not assign an official explanation absent from the guide.

## Missing values and data-quality findings

- No empty strings were found in any of the 32 fields. This does not mean the dataset is complete: coded missing and unknown values remain.
- Many guide fields define `-1` as “Data missing or out of range”. `propulsion_code` instead labels `-1` “Undefined”. Follow each field’s definition.
- Unknown codes are field-specific: for example `sex_of_driver=3`, `journey_purpose_of_driver=6`, and some fields use 9 or 99. Do not replace every 9 or 99 with null: these numbers can be valid categories elsewhere.
- Zero often has a real meaning, such as no tow, no impact, parked direction or not an e-scooter. Do not treat all zero values as missing.
- The guide does not explicitly define sentinel meanings for `age_of_vehicle` or `lsoa_of_driver`, and leaves the `driver_distance_banding=-1` label blank. Confirmation remains required.
- All observed values in enumerated category fields were found in their guide code lists. This membership check does not establish that combinations of fields are valid.

| Field | Literal -1 count |
| --- | ---: |
| `vehicle_type` | 661 |
| `towing_and_articulation` | 8,676 |
| `vehicle_manoeuvre_historic` | 278,182 |
| `vehicle_manoeuvre` | 16,854 |
| `vehicle_direction_from` | 23,872 |
| `vehicle_direction_to` | 24,022 |
| `vehicle_location_restricted_lane_historic` | 273,935 |
| `vehicle_location_restricted_lane` | 14,728 |
| `junction_location` | 6,368 |
| `skidding_and_overturning` | 14,866 |
| `hit_object_in_carriageway` | 12,499 |
| `vehicle_leaving_carriageway` | 14,851 |
| `hit_object_off_carriageway` | 4,881 |
| `first_point_of_impact` | 14,595 |
| `vehicle_left_hand_drive` | 259 |
| `journey_purpose_of_driver_historic` | 270,786 |
| `journey_purpose_of_driver` | 6,038 |
| `sex_of_driver` | 7,845 |
| `age_of_driver` | 142,240 |
| `age_band_of_driver` | 142,240 |
| `engine_capacity_cc` | 234,989 |
| `propulsion_code` | 218,032 |
| `age_of_vehicle` | 363,287 |
| `generic_make_model` | 227,368 |
| `driver_imd_decile` | 199,518 |
| `lsoa_of_driver` | 228,064 |
| `driver_distance_banding` | 651,858 |

## Differences across years and specifications

The supplied workbook says the historical versions were collected under the 2011 specification or earlier, while the newer versions were collected in or converted to the 2024 specification. Do not infer the original collection specification solely from collision year, and do not treat the two versions as independent events.

- Historical manoeuvre codes 16, 17 and 18 map to newer manoeuvre code 19, reducing detail about bends. Newer code 20 represents parking.
- Historical journey-purpose codes 3 and 4 map to code 7. Historical 5 (other) and 6 (unknown) map to newer 6. Therefore newer code 6 does not isolate only originally unknown journeys.
- Historical restricted-lane codes 2 and 3 map to newer 2; codes 6, 7 and 8 map to newer 6. Historical code 10 maps to -1 in the supplied conversion sheet.
- The conversion sheet lists vehicle type 90 plus a free-text field mapping to 33. This is not a rule to recode every other vehicle as a personal powered transporter; the qualifying free-text context matters.
- The guide notes generic_make_model was introduced in 2020, driver_imd_decile in 2016, and escooter_flag and driver_distance_banding in 2023. Actual coverage in this release can differ, as the distance-band counts show.

### Selected literal -1 counts by year

| Field | 2021 | 2022 | 2023 | 2024 | 2025 |
| --- | ---: | ---: | ---: | ---: | ---: |
| `vehicle_manoeuvre_historic` | 1,339 | 2,320 | 2,415 | 110,561 | 161,547 |
| `vehicle_manoeuvre` | 1,339 | 2,320 | 2,415 | 5,582 | 5,198 |
| `vehicle_location_restricted_lane_historic` | 1,276 | 2,394 | 2,466 | 108,255 | 159,544 |
| `vehicle_location_restricted_lane` | 1,276 | 2,394 | 2,466 | 3,224 | 5,368 |
| `journey_purpose_of_driver_historic` | 3 | 0 | 1 | 109,726 | 161,056 |
| `journey_purpose_of_driver` | 3 | 0 | 1 | 1,639 | 4,395 |
| `age_of_vehicle` | 45,068 | 42,929 | 40,900 | 50,442 | 183,948 |
| `driver_distance_banding` | 186,443 | 193,545 | 189,815 | 40,516 | 41,539 |

### Full vehicle conversion table from the supplied guide

| Historical field | Historical code | Historical label | Newer field | Newer code | Newer label |
| --- | --- | --- | --- | --- | --- |
| journey_purpose_of_driver_historic | 1 | Journey as part of work | journey_purpose_of_driver | 1 | Journey as part of work |
| journey_purpose_of_driver_historic | 2 | Commuting to/from work | journey_purpose_of_driver | 2 | Commuting to or from work |
| journey_purpose_of_driver_historic | 3 | Taking pupil to/from school | journey_purpose_of_driver | 7 | Education and educational escort |
| journey_purpose_of_driver_historic | 4 | Pupil riding to/from school | journey_purpose_of_driver | 7 | Education and educational escort |
| journey_purpose_of_driver_historic | 5 | Other | journey_purpose_of_driver | 6 | Not known or not requested |
| journey_purpose_of_driver_historic | 6 | Unknown | journey_purpose_of_driver | 6 | Not known or not requested |
| journey_purpose_of_driver_historic | - | - | journey_purpose_of_driver | 8 | Emergency vehicle (blue light) on response |
| journey_purpose_of_driver_historic | - | - | journey_purpose_of_driver | 9 | Personal business or leisure |
| vehicle_type | 3 | Motorcycle 125cc and under | vehicle_type | 3 | Motorcycle over 50cc and up to 125cc |
| vehicle_type | 17 | Agricultural vehicle | vehicle_type | 17 | Agricultural vehicle (including diggers etc) |
| vehicle_type | 18 | Tram | vehicle_type | 18 | Tram or light rail track  |
| vehicle_type | 90 | Other vehicle + free text field | vehicle_type | 33 | Personal Powered Transporter |
| vehicle_manoeuvre_historic | 1 | Reversing | vehicle_manoeuvre | 1 | Reversing  |
| vehicle_manoeuvre_historic | 2 | Parked | vehicle_manoeuvre | 2 | Parked |
| vehicle_manoeuvre_historic | 3 | Waiting to go - held up | vehicle_manoeuvre | 3 | Waiting to go ahead  |
| vehicle_manoeuvre_historic | 4 | Slowing or stopping | vehicle_manoeuvre | 4 | Slowing or stopping  |
| vehicle_manoeuvre_historic | 5 | Moving off | vehicle_manoeuvre | 5 | Moving off |
| vehicle_manoeuvre_historic | 6 | U-turn | vehicle_manoeuvre | 6 | U-turn  |
| vehicle_manoeuvre_historic | 7 | Turning left | vehicle_manoeuvre | 7 | Turning left |
| vehicle_manoeuvre_historic | 8 | Waiting to turn left | vehicle_manoeuvre | 8 | Waiting to turn left  |
| vehicle_manoeuvre_historic | 9 | Turning right | vehicle_manoeuvre | 9 | Turning right  |
| vehicle_manoeuvre_historic | 10 | Waiting to turn right | vehicle_manoeuvre | 10 | Waiting to turn right  |
| vehicle_manoeuvre_historic | 11 | Changing lane to left | vehicle_manoeuvre | 11 | Changing lane to left  |
| vehicle_manoeuvre_historic | 12 | Changing lane to right | vehicle_manoeuvre | 12 | Changing lane to right  |
| vehicle_manoeuvre_historic | 13 | Overtaking moving vehicle - offside | vehicle_manoeuvre | 13 | Over taking moving vehicle on its offside  |
| vehicle_manoeuvre_historic | 14 | Overtaking static vehicle - offside | vehicle_manoeuvre | 14 | Overtaking stationary vehicle on its offside  |
| vehicle_manoeuvre_historic | 15 | Overtaking - nearside | vehicle_manoeuvre | 15 | Overtaking on nearside (passengers side nearest kerb) |
| vehicle_manoeuvre_historic | 16 | Going ahead left-hand bend | vehicle_manoeuvre | 19 | Going ahead  |
| vehicle_manoeuvre_historic | 17 | Going ahead right-hand bend | vehicle_manoeuvre | 19 | Going ahead  |
| vehicle_manoeuvre_historic | 18 | Going ahead other | vehicle_manoeuvre | 19 | Going ahead  |
| vehicle_manoeuvre_historic | - | - | vehicle_manoeuvre | 20 | Parking  |
| vehicle_manoeuvre_historic | 99 | Unknown (self rep only) | vehicle_manoeuvre | 99 | Unknown (self rep only) |
| vehicle_location_restricted_lane_historic | 0 | On main carriage way - not in restricted lane | vehicle_location_restricted_lane | 0 | On main carriageway (not in restricted lane) |
| vehicle_location_restricted_lane_historic | 1 | Tram/Light rail track | vehicle_location_restricted_lane | 1 | Tram or Light rail track |
| vehicle_location_restricted_lane_historic | 10 | Not on carriageway | vehicle_location_restricted_lane | -1 | - |
| vehicle_location_restricted_lane_historic | 2 | Bus lane | vehicle_location_restricted_lane | 2 | Bus lane or Busway |
| vehicle_location_restricted_lane_historic | 3 | Busway (including guided busway) | vehicle_location_restricted_lane | 2 | Bus lane or Busway |
| vehicle_location_restricted_lane_historic | 4 | Cycle lane (on main carriageway) | vehicle_location_restricted_lane | 4 | Cycle lane (on main carriageway) |
| vehicle_location_restricted_lane_historic | 5 | Cycleway or shared use footway (not part of  main carriageway) | vehicle_location_restricted_lane | 5 | Cycleway or shared use footway (not part of main carriageway)  |
| vehicle_location_restricted_lane_historic | 6 | On lay-by or hard shoulder | vehicle_location_restricted_lane | 6 | Lay-by or hard shoulder |
| vehicle_location_restricted_lane_historic | 7 | Entering lay-by or hard shoulder | vehicle_location_restricted_lane | 6 | Lay-by or hard shoulder |
| vehicle_location_restricted_lane_historic | 8 | Leaving lay-by or hard shoulder | vehicle_location_restricted_lane | 6 | Lay-by or hard shoulder |
| vehicle_location_restricted_lane_historic | 9 | Footway (pavement) | vehicle_location_restricted_lane | 9 | Footway (pavement)  |
| vehicle_location_restricted_lane_historic | 99 | Unknown (self rep only) | vehicle_location_restricted_lane | 99 | Unknown (self rep only) |

## Review status and remaining checks

- [x] All 32 columns listed with plain-language meanings and logical types.
- [x] Vehicle code labels and notes extracted from the supplied official workbook.
- [x] Empty strings, literal -1 values, year counts and vehicle key duplicates checked.
- [x] Specification mappings documented from the supplied conversion sheet.
- [ ] Confirm sentinel meanings where the supplied guide is silent.
- [ ] Explain the source/release reason for all 2025 vehicle ages being -1; no cause has been assumed.
- [ ] Test joins against the actual collision and casualty files.
- [ ] Review extreme measurement values and cross-field consistency.
- [ ] Review historical release/revision documentation. This comparison concerns one combined release and its supplied guide, not separately archived annual releases.
- [ ] Have a teammate review the document and commit it to GitHub.

## Work log

| Date | Work completed |
| --- | --- |
| 2026-11-07 | Inspected supplied CSV and DfT guide; prepared 32-field dictionary, code lists, year counts, missing-value findings and relationship notes. |

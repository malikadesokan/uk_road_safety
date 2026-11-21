WITH vehicle_left_hand_drive AS (
    {{ get_vehicle_lookup_table('vehicle_left_hand_drive_veh_lookup_table') }}
)

SELECT * FROM vehicle_left_hand_drive;

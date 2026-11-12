import pandas as pd
from clean_dict import dictionaries_col, dictionaries_casualty
import config

collision_lookup_tables = {}
casualty_lookup_tables = {}
vehicle_lookup_tables = {}

def extract_collision_lookup_tables():
    """
    Imports the collision dictionaries and converts each dictionary
    into a Pandas DataFrame.

    Each DataFrame represents a lookup table that maps DfT numeric
    codes to their corresponding descriptions.

    The resulting lookup tables are stored in a dictionary and
    exported individually as CSV files
    """
    for collision, collision_tables in dictionaries_col.items():
        print(f"Extracting {collision} lookup tables")
        df = pd.DataFrame(
            collision_tables.items(),
            columns= ['dft_value', 'full_name']
        )

        collision_lookup_tables[collision] = df

        df.to_csv(f"{config.LOOKUP_PATH}/{collision}_col_lookup_table.csv", index=False)
        print(f"{collision} table successfully extracted")

    col_len = len(collision) 

    print(f"{col_len} tables extracted! Happy days 👌")

if __name__ == "__main__":
        extract_collision_lookup_tables()

def extract_casualty_lookup_tables():
    """
    Imports the casualty dictionaries and converts each dictionary
    into a Pandas DataFrame.

    Each DataFrame represents a lookup table that maps DfT numeric
    codes to their corresponding descriptions.

    The resulting lookup tables are stored in a dictionary and
    exported individually as CSV files
    """
    for casualty, casualty_tables in dictionaries_casualty.items():
        print(f"Extracting {casualty} lookup tables")
        df = pd.DataFrame(
            casualty_tables.items(),
            columns= ['dft_value', 'full_name']
        )

        collision_lookup_tables[casualty] = df

        df.to_csv(f"{config.LOOKUP_PATH}/{casualty}_cas_lookup_table.csv", index=False)
        print(f"{casualty} table successfully extracted")

    cas_len = len(casualty) 

    print(f"{cas_len} tables extracted! Happy days 👌")

if __name__ == "__main__":
        extract_casualty_lookup_tables()

def extract_vehicle_lookup_tables():
    """
    Imports the vehicles dictionaries and converts each dictionary
    into a Pandas DataFrame.

    Each DataFrame represents a lookup table that maps DfT numeric
    codes to their corresponding descriptions.

    The resulting lookup tables are stored in a dictionary and
    exported individually as CSV files
    """
    for vehicle, vehicle_tables in dictionaries_casualty.items():
        print(f"Extracting {vehicle} lookup tables")
        df = pd.DataFrame(
            vehicle_tables.items(),
            columns= ['dft_value', 'full_name']
        )

        collision_lookup_tables[vehicle] = df

        df.to_csv(f"{config.LOOKUP_PATH}/{vehicle}_veh_lookup_table.csv", index=False)
        print(f"{vehicle} table successfully extracted")

    veh_len = len(vehicle) 

    print(f"{veh_len} tables extracted! Happy days 👌")

if __name__ == "__main__":
        extract_vehicle_lookup_tables()
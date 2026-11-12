import pandas as pd
import config

# Extract Collisions Data and Save as CSV File
def extract_collision_data():
        print("Extracting collision data")
        df = pd.read_csv(config.COLLISION, dtype={
                "collision_index" : "string",
                "collision_ref_no" : "string"
        })
        df.to_csv(f"{config.DATA_PATH}/collision_data.csv", index=False)
        df_count = len(df)
        print(f"{df_count} collsion data successfully extracted")

if __name__ == "__main__":
        extract_collision_data()

# Extract Vehicles Data and Save as CSV File
def extract_vehicles_data():
        print("Extracting vehicles data")
        df = pd.read_csv(config.VEHICLES, dtype={
                "generic_make_model" : "string"
        })
        df.to_csv(f"{config.DATA_PATH}/vehicle_data.csv", index=False)
        df_count = len(df)
        print(f"{df_count} vehicle data successfully extracted")

if __name__ == "__main__":
        extract_vehicles_data()

# Extract Casualties Data and Save as CSV File
def extract_casualties_data():
        print("Extracting casualties data")
        df = pd.read_csv(config.CAUSALTIES)
        df.to_csv(f"{config.DATA_PATH}/casulties_data.csv", index=False)
        df_count = len(df)
        print(f"{df_count} casulties data successfully extracted")

if __name__ == "__main__":
        extract_casualties_data()


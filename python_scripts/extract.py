import pandas as pd
from pathlib import Path
from datetime import datetime
import config


def extract_collision_data():
        print("Exctracting collision data")
        df = pd.read_csv(config.COLLISION, dtype={
                "collision_index" : "string",
                "collision_ref_no" : "string"
        })
        df.to_csv(f"{config.DATA_PATH}/collision_data.csv", index=False)
        df_count = len(df)
        print(f"{df_count} collsion data successfully extracted")

if __name__ == "__main__":
        extract_collision_data()


def extract_vehicles_data():
        print("Exctracting vehicles data")
        df = pd.read_csv(config.VEHICLES, dtype={
                "generic_make_model" : "string"
        })
        df.to_csv(f"{config.DATA_PATH}/vehicle_data.csv", index=False)
        df_count = len(df)
        print(f"{df_count} vehicle data successfully extracted")

if __name__ == "__main__":
        extract_vehicles_data()


def extract_casualties_data():
        print("Exctracting casualties data")
        df = pd.read_csv(config.CAUSALTIES)
        df.to_csv(f"{config.DATA_PATH}/casulties_data.csv", index=False)
        df_count = len(df)
        print(f"{df_count} casulties data successfully extracted")

if __name__ == "__main__":
        extract_casualties_data()


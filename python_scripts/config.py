import os
from dotenv import load_dotenv

load_dotenv()
"""
Postgres Credentials
"""
# DB_USER = os.getenv('DB_USER')
# DB_PASS = os.getenv('DB_PASS')
# DB_HOST = os.getenv('DB_HOST')
# DB_PORT = os.getenv('DB_PORT')
# DB_NAME = os.getenv('DB_NAME')

"""
GCP Credentials
"""

PROJECT_ID = os.getenv('GCP_PROJECT_ID')
BUCKET_NAME = os.getenv('GCS_BUCKET_NAME')

# bucket_name = os.getenv("GCS_BUCKET_NAME")

DATA_PATH = "./data/raw/"

COLLISION_CSV = "./data/raw/collision.csv"

LANDING_DATASET = "landing_layer"

LOOKUP_PATH = "./data/lookups/"

COLLISION = "https://data.dft.gov.uk/road-accidents-safety-data/dft-road-casualty-statistics-collision-last-5-years.csv" # noqa E501

VEHICLES = "https://data.dft.gov.uk/road-accidents-safety-data/dft-road-casualty-statistics-vehicle-last-5-years.csv" # noqa E501

CAUSALTIES = "https://data.dft.gov.uk/road-accidents-safety-data/dft-road-casualty-statistics-casualty-last-5-years.csv" # noqa E501
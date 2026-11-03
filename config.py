import os
from dotenv import load_dotenv

load_dotenv()



DATABASE_URL = f"postgresql+psycopg2://{DB_USER}:{DB_PASS}@{DB_HOST}:{DB_PORT}/{DB_NAME}" # noqa E501
## DATA_SOURCE = "https://docs.google.com/spreadsheets/d/e/2PACX-1vTIBPRSnUp10oHj5fhnUTlUJn-W7DtjSRtXIhySqW_1nZak5u4b7bPc9gTcWPHM22JL0aZJJa5QakM1/pub?gid=0&single=true&output=csv" # noqa E501

COLLISION = "https://data.dft.gov.uk/road-accidents-safety-data/dft-road-casualty-statistics-collision-last-5-years.csv" # noqa E501

VEHICLES = "https://data.dft.gov.uk/road-accidents-safety-data/dft-road-casualty-statistics-vehicle-last-5-years.csv" # noqa E501

CAUSALTIES = "https://data.dft.gov.uk/road-accidents-safety-data/dft-road-casualty-statistics-casualty-last-5-years.csv" # noqa E501
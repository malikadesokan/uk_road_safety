import config

from pathlib import Path
from google.cloud import storage

# Connect to GCS
client = storage.Client(project=config.PROJECT_ID)

# Get bucket
bucket = client.bucket(config.BUCKET_NAME)

# Local data directory for lookup datafiles
local_path = Path(config.LOOKUP_PATH)

# Iterate through all CSV files
for local_file in local_path.rglob("*.csv"):

    # Preserve directory structure
    relative_path = local_file.relative_to(local_path)

    # Define GCS destination
    blob = bucket.blob(
        f"lookup_tables/{relative_path.as_posix()}"
    )

    # Upload file
    blob.upload_from_filename(str(local_file))

    print(f"Successfully uploaded: {local_file.name}")

from google.cloud import bigquery, storage
import config


def load_gcs_to_bigquery():

    # Initialise Google Cloud clients
    storage_client = storage.Client(project=config.PROJECT_ID)
    bigquery_client = bigquery.Client(project=config.PROJECT_ID)

    # Get GCS bucket
    bucket = storage_client.bucket(config.BUCKET_NAME)

    # Get CSV files from the raw folder
    blobs = storage_client.list_blobs(
        config.BUCKET_NAME,
        prefix="raw/"
    )

    # Configure CSV loading
    job_config = bigquery.LoadJobConfig(
        source_format=bigquery.SourceFormat.CSV,
        skip_leading_rows=1,
        autodetect=True,
        write_disposition=bigquery.WriteDisposition.WRITE_TRUNCATE
    )

    # Load each CSV file into BigQuery
    for blob in blobs:

        if blob.name.endswith(".csv"):

            # Extract filename without extension
            table_name = blob.name.split("/")[-1].replace(".csv", "")

            # Define GCS file location
            gcs_uri = f"gs://{config.BUCKET_NAME}/{blob.name}"

            # Define BigQuery destination table
            table_id = (
                f"{config.PROJECT_ID}.landing_layer.{table_name}"
            )

            print(f"Loading {blob.name}...")

            # Load data
            job = bigquery_client.load_table_from_uri(
                gcs_uri,
                table_id,
                job_config=job_config
            )

            # Wait for completion
            job.result()

            print(f"Successfully loaded {table_name} into BigQuery")

    print("GCS to BigQuery loading completed.")


if __name__ == "__main__":
    load_gcs_to_bigquery()

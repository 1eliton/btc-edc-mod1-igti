def hello_gcs_bq(event, context):
    """Background Cloud Function to be triggered by Cloud Storage.
       This generic function logs relevant data when a file is changed.
    Args:
        event (dict):  The dictionary with data specific to this type of event.
                       The `data` field contains a description of the event in
                       the Cloud Storage `object` format described here:
                       https://cloud.google.com/storage/docs/json_api/v1/objects#resource
        context (google.cloud.functions.Context): Metadata of triggering event.
    Returns:
        None; the output is written to Stackdriver Logging
    """
    print('Iniciando minha primeira function no GCP // first function on GCP!')

    from google.cloud import bigquery

    # Construct a BigQuery client object.
    client = bigquery.Client()

    table_id = "poc-gcp-340811.rais2020.rais2020-table"

    job_config = bigquery.LoadJobConfig(
        # schema=[
        #     bigquery.SchemaField("name", "STRING"),
        #     bigquery.SchemaField("post_abbr", "STRING"),
        # ],
        skip_leading_rows=1,
        # The source format defaults to CSV, so the line below is optional.
        source_format=bigquery.SourceFormat.CSV,
        autodetect=True,
        field_delimiter=';'
        #encoding='latin1'
    )

    uri = "gs://poc_igti_btc_edc_enem_raw_data_001/RAIS_VINC_PUB_CENTRO_OESTE.txt"

    load_job = client.load_table_from_uri(
        uri, table_id, job_config=job_config
    )  # Make an API request.

    load_job.result()  # Waits for the job to complete.

    destination_table = client.get_table(table_id)  # Make an API request.
    print("Loaded {} rows on table {}.".format(destination_table.num_rows, table_id))

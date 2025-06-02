# Kestra Setup

Kestra is an orchestration tool for data engineering that enables Data Engineers to write ELT workflows using YAML-formatted files called `flows`.

## Getting Started

To start Kestra, ensure you are in the project's working directory, then run:

```bash
make kestra
```
This will launch the Kestra UI, which can be accessed through your browser at: http://127.0.0.1:8000

## Project Workflows

The project's workflows are located in the `orchestration` directory. Here are the main flows:

1. [Data Extraction Flow](../orchestration/flows/01_gcp_iowa_liquor.yaml): Extracts Iowa liquor sales data and stores it in Google Cloud Storage (GCS).
2. [Data Loading Flow](../orchestration/flows/02_gcp_iowa_liquor_scheduled.yaml): Loads data from GCS, preprocesses it, and loads it into BigQuery.
3. [Data Transformation Flow](../orchestration/flows/03_gcp_iowa_liquor_dbt_transform.yaml): Performs data modeling and generates analytical insights using dbt.

## Importing Flows

To import the flows into Kestra, follow these steps:

1. Make the import script executable:
```bash
chmod +x addFlow.sh
```

2. Run the import script:
```bash
./addFlow.sh
```
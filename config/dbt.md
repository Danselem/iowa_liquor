## Setup BigQuery dbt profile.

To create a dbt profile, follow the commands:

```bash
mkdir ~/.dbt/
vi ~/.dbt/profiles.yml
```

Copy and paste the info below into ~/.dbt/profiles.yml:
Change `dataset`, `location`, `project` to your gcp project id.
`taxi_data` can be renamed to your choice.

```bash
liquor_data:
  outputs:
    dev:
      dataset: iowa_liquor
      fixed_retries: 1
      keyfile: /.google/credentials/google_credentials.json
      location: US
      method: service-account
      priority: interactive
      project: scenic-dynamo-447811-m9
      threads: 4
      timeout_seconds: 300
      type: bigquery
  target: dev
```

## Debug DBT

```bash
make debug-dbt
```

### Install dependencies
```bash
make deps
```

### Build DBT
```bash
make dbt-build
```
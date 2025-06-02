# Iowa Liquor Data Engineering Project

A Data Engineering Capstone project that processes and analyzes Iowa Liquor sales data using modern data engineering tools and practices.

## Project Overview

This project implements a data pipeline to process and analyze Iowa Liquor sales data. It includes data ingestion, transformation, and analytics components using industry-standard tools and best practices.

## Project Structure

```
.
├── analytics/         # Analytics and reporting components
├── orchestration/     # Workflow orchestration files
├── terraform/         # Infrastructure as Code (IaC) configurations
├── Makefile          # Build and deployment automation
├── requirements.txt   # Python dependencies
└── pyproject.toml    # Project configuration
```

## Prerequisites

- Python 3.x
- Docker
- Google Cloud Platform (GCP) account
- GCP credentials configured

## Setup Instructions

1. Clone the repository:
```bash
git clone https://github.com/Danselem/iowa_liquor.git
cd iowa_liquor
```

2. Set up Python virtual environment:
```bash
python -m venv .venv
source .venv/bin/activate  # On Windows: .venv\Scripts\activate
```

3. Install dependencies:
```bash
pip install -r requirements.txt
```

4. Configure GCP credentials:
   - Place your GCP credentials in `.google/credentials/google_credentials.json`
   - Ensure the credentials have necessary permissions for BigQuery operations

4. Set up kestra with docker
    - To get kestra running, follow the instruction in [Kestra set up](config/kestra.md).

5. Set up dbt:
   - Configure your dbt profile in `~/.dbt/profiles.yml`
   - Follow the dbt setup instructions in [View DBT config](config/dbt.md).

## Usage

1. Build the project:
```bash
make build
```

2. Run the data pipeline:
```bash
make run
```

3. Run tests:
```bash
make test
```

## Infrastructure

The project uses Terraform for infrastructure management. Infrastructure configurations can be found in the `terraform/` directory.

## Contributing

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## License

This project is licensed under the terms of the [MIT license](LICENSE) included in the repository.

## Acknowledgments

- Data Engineering Zoomcamp
- Iowa Department of Commerce - Alcoholic Beverages Division


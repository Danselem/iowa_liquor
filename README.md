# Iowa Liquor Sales Analytics

A data engineering project for analyzing Iowa liquor sales data using modern data stack tools.

## Project Structure

```
.
├── analytics/                    # Analytics and data transformation
│   ├── liquor_sales_iowa/       # dbt project for Iowa liquor sales
│   ├── dbt/                     # dbt configurations and models
│   ├── sqls/                    # Raw SQL queries
│   ├── Dockerfile              # Docker configuration for analytics
│   └── docker-compose.yaml     # Docker compose for analytics services
│
├── orchestration/               # Workflow orchestration
│   ├── flows/                  # Kestra workflow definitions
│   ├── docker-compose.yml      # Docker compose for Kestra
│   └── addFlow.sh             # Helper script for adding flows
│
├── terraform/                   # Infrastructure as Code
│
├── docs/                        # Project documentation
│
├── config/                      # Configuration files
│
├── .github/                     # GitHub configurations
│   └── workflows/              # GitHub Actions workflows
│
├── Makefile                    # Project build and management commands
├── requirements.txt            # Python dependencies
├── pyproject.toml             # Python project configuration
└── LICENSE                     # Project license
```

## Key Components

### Analytics
- **dbt Project**: Located in `analytics/liquor_sales_iowa/`, contains all data transformation models
- **SQL Queries**: Raw SQL queries stored in `analytics/sqls/`
- **Docker Configuration**: Containerized analytics environment

### Orchestration
- **Kestra Flows**: Workflow definitions in `orchestration/flows/`
- **Docker Compose**: Local development environment for Kestra

### Infrastructure
- **Terraform**: Infrastructure as Code definitions in `terraform/`

## Development Setup

1. Install Python 3.10
2. Install uv package manager
3. Run the following commands:
   ```bash
   make init        # Initialize virtual environment
   make install     # Install dependencies
   make kestra      # Start Kestra locally
   ```

## Available Commands

- `make debug-dbt`: Debug dbt configuration
- `make deps`: Install dbt dependencies
- `make dbt-build`: Run dbt build with full refresh
- `make load`: Run data loading pipeline
- `make kestra`: Start Kestra orchestration
- `make delete`: Clean up development environment

## CI/CD

The project uses GitHub Actions for continuous integration and deployment. The workflow is defined in `.github/workflows/ci-cd.yml` and includes:
- Python environment setup
- Dependency installation
- dbt testing and building
- Data pipeline execution

## License

This project is licensed under the terms of the license included in the `LICENSE` file.

## Acknowledgments

- Data Engineering Zoomcamp
- Iowa Department of Commerce - Alcoholic Beverages Division


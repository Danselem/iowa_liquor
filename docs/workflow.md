```mermaid
graph TD
    subgraph "Data Ingestion"
        A[("fa:fa-database fa-2x Iowa Liquor Sales Data")] -->|Raw Data| B[("fa:fa-cloud fa-2x GCS Bucket")]
        B -->|Data Lake| C[("fa:fa-table fa-2x BigQuery Raw Tables")]
    end

    subgraph "Data Processing"
        C -->|dbt Transformations| D[("fa:fa-table fa-2x BigQuery Staging Tables")]
        D -->|dbt Models| E[("fa:fa-table fa-2x BigQuery Analytics Tables")]
    end

    subgraph "Orchestration"
        F[("fa:fa-cogs fa-2x Kestra Workflows")] -->|Schedule & Monitor| A
        F -->|Orchestrate| B
        F -->|Manage| C
        F -->|Control| D
        F -->|Coordinate| E
        I[("fa:fa-docker fa-2x Docker")] -->|Containerize| F
        I -->|Deploy| H
    end

    subgraph "Infrastructure"
        G[("fa:fa-code fa-2x Terraform")] -->|Provision| H[("fa:fa-cloud fa-2x GCP Resources")]
        H -->|Host| B
        H -->|Host| C
        H -->|Host| D
        H -->|Host| E
    end

    subgraph "Analytics"
        E -->|Query| J[("fa:fa-chart-line fa-2x Business Intelligence")]
        E -->|Analyze| K[("fa:fa-chart-bar fa-2x Data Analytics")]
        E -->|Visualize| L[("fa:fa-chart-pie fa-2x Dashboards")]
    end

    style A fill:#f9f,stroke:#333,stroke-width:2px
    style B fill:#bbf,stroke:#333,stroke-width:2px
    style C fill:#bbf,stroke:#333,stroke-width:2px
    style D fill:#bbf,stroke:#333,stroke-width:2px
    style E fill:#bbf,stroke:#333,stroke-width:2px
    style F fill:#fbb,stroke:#333,stroke-width:2px
    style G fill:#bfb,stroke:#333,stroke-width:2px
    style H fill:#bfb,stroke:#333,stroke-width:2px
    style I fill:#0db7ed,stroke:#333,stroke-width:2px
    style J fill:#fbb,stroke:#333,stroke-width:2px
    style K fill:#fbb,stroke:#333,stroke-width:2px
    style L fill:#fbb,stroke:#333,stroke-width:2px
```

# Iowa Liquor Data Engineering Workflow

This diagram illustrates the complete data engineering workflow for the Iowa Liquor project, now enhanced with larger icons and Docker in the Orchestration section. The workflow is divided into five main components:

1. **Data Ingestion**
   - Raw data from Iowa Liquor Sales is ingested into Google Cloud Storage (GCS)
   - Data is then loaded into BigQuery raw tables

2. **Data Processing**
   - dbt transformations process the raw data
   - Data moves through staging to analytics tables
   - Transformations ensure data quality and consistency

3. **Orchestration**
   - Kestra workflows manage the entire pipeline
   - Docker containerizes and deploys the applications
   - Schedules and monitors data ingestion
   - Orchestrates transformations and data movement

4. **Infrastructure**
   - Terraform manages GCP resources
   - Provisions and maintains all necessary infrastructure
   - Ensures scalability and reliability

5. **Analytics**
   - Processed data enables business intelligence
   - Supports data analytics and reporting
   - Powers interactive dashboards

The workflow is designed to be scalable, maintainable, and follows modern data engineering best practices.

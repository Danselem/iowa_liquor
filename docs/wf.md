graph TD
    subgraph "Data Ingestion"
        A[Iowa Liquor Sales Data] -->|Raw Data| B[GCS Bucket]
        B -->|Data Lake| C[BigQuery Raw Tables]
    end

    subgraph "Data Processing"
        C -->|dbt Transformations| D[BigQuery Staging Tables]
        D -->|dbt Models| E[BigQuery Analytics Tables]
    end

    subgraph "Orchestration"
        F[Kestra Workflows] -->|Schedule & Monitor| A
        F -->|Orchestrate| B
        F -->|Manage| C
        F -->|Control| D
        F -->|Coordinate| E
    end

    subgraph "Infrastructure"
        G[Terraform] -->|Provision| H[GCP Resources]
        H -->|Host| B
        H -->|Host| C
        H -->|Host| D
        H -->|Host| E
    end

    subgraph "Analytics"
        E -->|Query| I[Business Intelligence]
        E -->|Analyze| J[Data Analytics]
        E -->|Visualize| K[Dashboards]
    end

    style A fill:#f9f,stroke:#333,stroke-width:2px
    style B fill:#bbf,stroke:#333,stroke-width:2px
    style C fill:#bbf,stroke:#333,stroke-width:2px
    style D fill:#bbf,stroke:#333,stroke-width:2px
    style E fill:#bbf,stroke:#333,stroke-width:2px
    style F fill:#fbb,stroke:#333,stroke-width:2px
    style G fill:#bfb,stroke:#333,stroke-width:2px
    style H fill:#bfb,stroke:#333,stroke-width:2px
    style I fill:#fbb,stroke:#333,stroke-width:2px
    style J fill:#fbb,stroke:#333,stroke-width:2px
    style K fill:#fbb,stroke:#333,stroke-width:2px

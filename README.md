# Modern Data Stack - jaffle_shop (dbt + Postgres/Docker)

[![Python](https://img.shields.io/badge/Python-3.12-blue.svg)](https://www.python.org/)
[![dbt](https://img.shields.io/badge/dbt-1.10-orange.svg)](https://www.getdbt.com/)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-16-blue.svg)](https://www.postgresql.org/)
[![Docker](https://img.shields.io/badge/Docker-Container-blue.svg)](https://www.docker.com/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

This is a training and proof-of-concept project. The main goal was to get hands-on experience with the **dbt (Data Build Tool)** ecosystem and understand how modern Analytics Engineering solves real-world bottlenecks between business and technology.

## Why Analytics Engineering?

Working on this repository made it clear to me that the Analytics Engineer role is the missing link in data teams:

* **Unblocking Data Engineers:** Platform engineers can focus on core architecture and moving raw data to the warehouse (ingestion). They stop being a bottleneck for analysts who are constantly waiting for a "table fix."
* **Empowering Data Analysts:** Analysts get clean, tested, and fully documented models that act as a Single Source of Truth. They can focus on the core of their job – driving insights and business value – instead of wasting time manually cleaning data inside BI tools.
* **Software Engineering Best Practices:** dbt brings software development rigor to analytics – including version control (Git), automated testing, and modular code.

---

## Architecture & Tech Stack

The project replicates a cloud-like data warehouse environment using localized, containerized infrastructure.

* **Data Transformation:** `dbt-core` (version `1.10.8` for syntax stability).
* **Database:** `PostgreSQL 16` running inside a **Docker** container (simulating a cloud data warehouse).
* **Development Environment:** VS Code with custom extensions to handle Jinja SQL and YAML configurations.

---

## Key Features Implemented

1. **Containerized Database:** Setting up the database infrastructure via `docker-compose` with persistent storage volumes.
2. **Staging Layer (stg):** Cleaning raw data (from Stripe and Jaffle Shop sources), unifying column naming conventions, and standardizing data types using the `{{ source() }}` macro.
3. **Automated Testing:**

    * Implemented built-in generic tests (`unique`, `not_null`, `accepted_values`, `relationships` using the updated dbt 1.10+ syntax).
    * Created reusable custom generic tests for business rule validation (e.g., ensuring numeric amounts are never negative).

4. **Project Configuration:** Fully resolved compiler warnings (`dbt parse`), properly isolated the environment via `.gitignore`, and streamlined model materializations in `dbt_project.yml`.

---

## Local Setup

1. Spin up the Postgres database in Docker:

```text
   docker compose up -d
```

Activate your virtual environment and install the required packages (using strict versions to avoid pip dependency conflicts):

```text
   .venv\Scripts\activate
   pip install dbt-core==1.10.8 dbt-postgres==1.9.0
```

Load raw seed data, build models, and run the tests using a single command::

```text
   dbt build
```

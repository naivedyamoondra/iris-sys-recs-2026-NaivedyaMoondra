# Bonus Task 2: Automated Backup Daemon (Database + Code)

## Objective
Implement an automated daemon to periodically back up both the database and application source code.

## Overview
A dedicated backup service was added to the Docker Compose setup to provide automated, periodic backups.
The backup container:
* Connects to the MySQL database
* Performs database dumps using `mysqldump`
* Archives and compresses the application source code
* Generates timestamped backup files
* Runs continuously in daemon mode
* Stores backups on the host machine

## Implementation Details
A new service named `backup` was added to `docker-compose.yml`.
The service:
* Uses a lightweight Alpine Linux image
* Installs MySQL client tools at runtime
* Connects to the MySQL container via Docker network
* Executes periodic backup operations every hour
* Stores backups in host-mounted directories:
  * `db_backups/`
  * `code_backups/`

## Backup Process
Every 3600 seconds:
1. The container executes `mysqldump` to export the database.
2. A timestamped SQL file is generated.
3. The full project directory is archived and compressed using `tar` and `gzip`.
4. Files are saved to the respective host directories.

Example generated files:
* `db-2026-02-14-07-27-27.sql`
* `code-2026-02-14-07-38-20.tar.gz`

## Verification
* The `db_backups/` directory contains .sql files.
* The `code_backups/` directory contains .tar.gz files.
* The backup container logs confirm periodic execution.
* Backup files persist even if containers are restarted.

## Outcome
The system now includes an automated backup daemon that:
* Protects database data
* Protects application source code
* Runs without manual intervention
* Supports disaster recovery scenarios

This demonstrates implementation of automated backup and data protection within a containerized environment.
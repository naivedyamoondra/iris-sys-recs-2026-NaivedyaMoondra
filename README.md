# Task 6: Full Stack Setup with Docker Compose

## Objective
Automate the deployment of the entire multi-container stack using a single declarative configuration file (`docker-compose.yml`), replacing manual container management with docker compose.

---

## Setup Overview

* Defined all services (MySQL, Rails, Nginx) in a unified Compose file, called (`docker-compose.yml`).
* Implemented a named Docker volume for the MySQL service to ensure data survives container restarts, also called data persistence.
* Three Rails application instances are defined and built from the project Dockerfile.
* Configured Nginx as a reverse proxy to distribute traffic across the Rails applications.
* Connected all services to a shared internal network for secure communication, using docker compose.



---

## Implementation Details

1. The MySQL service mounts a named volume at `/var/lib/mysql` to preserve data.
2. Three Rails containers run simultaneously, connecting to the same shared database.
3. Nginx uses an `upstream` configuration to balance incoming HTTP requests.
4. The entire stack is launched with a single command:  
   `docker compose up --build`
5. Migrations are run once, targeting the shared database used by all instances.

---

## Verification

* Confirmed that the application is accessible at http://localhost.
* Verified that Nginx successfully distributes traffic across multiple Rails containers.
* Confirmed that running `docker compose down` and `up` preserves all database records, validating the volume configuration.

---

## Outcome
The stack is fully setup using Docker Compose. This approach simplifies deployment, ensures consistency across environments, and provides built-in load balancing and persistence.
## Task 5: Database Persistence Using Docker Volumes

### Objective  
Ensure that the MySQL database data persists even if the database container is stopped or removed.

---

### Setup Overview  

- A Docker volume is created to store MySQL data outside the container filesystem.
- The MySQL container mounts this volume at `/var/lib/mysql`, which is the default data directory used by MySQL.
- Rails application containers continue to connect to the same MySQL service over the Docker network.
- No changes are required in the Rails application code.

---

### Implementation Details  

- A named Docker volume is created and attached to the MySQL container.
- The database schema is initialized using Rails migrations.
- The MySQL container is stopped and removed to verify persistence.
- The container is recreated using the same volume, and existing database data remains intact.

---

### Persistence Verification  

After deleting and recreating the MySQL container, the previously created database is still available, confirming that the data is successfully persisted using Docker volumes.

---

### Outcome  

The database state is preserved independently of the container lifecycle, demonstrating correct use of Docker volumes for persistent storage.

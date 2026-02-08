# Task 2: Multi-Container Orchestration with MySQL

## Objective

Deploy a separate MySQL database container and establish a secure, isolated network connection between the Rails application and the database.

---

## Steps Followed

1. **Network Isolation:** Created a custom Docker bridge network (`iris-net`) to facilitate private communication between containers without exposing the database to the host machine.


2. **Database Provisioning:** Launched a MySQL 8.0 container attached to the private network.
    * **Security:** Configured the database without host port mapping to ensure it remains internal-only.
    * **Environment:** Defined root credentials, a dedicated application user (`iris_user`), and the target database (`iris_db`) via environment variables.

3. **Configuration Alignment:** Updated `config/database.yml` to use `iris-mysql` (the container name) as the hostname.

4. **Process Management:** Synchronized the launch timing to ensure the MySQL service was "ready for connections" before the Rails boot process initialized.

5. **Port Mapping:** Exposed the application on host port 8080 while the container continues to run internally on port 3000.


---

## Verification

* **Connectivity:** The Rails container successfully resolves the `iris-mysql` hostname and establishes a TCP connection.
* **Isolation:** Verified that the MySQL port (3306) is not accessible from the host machine, while the Rails app is reachable.
* **Accessibility:** The application is fully functional and accessible at http://localhost:8080.

---

## Outcome

The Rails application and MySQL database are successfully running in separate, linked containers. The setup fulfills all security and networking requirements, completing Task 2.
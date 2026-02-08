# Task 3: Nginx Reverse Proxy Setup

## Objective
Expose the Rails application through an Nginx reverse proxy running in a separate Docker container.

---

## Steps Followed

1. **Network Configuration:** Created a dedicated Docker network to allow secure inter-container communication between Nginx, Rails, and MySQL.

2. **Database Provisioning:** Ran the MySQL container on the same network using predefined database credentials to ensure data persistence and connectivity.

3. **Application Deployment:** Ran the Rails application container in isolated mode, without exposing its internal port (3000) directly to the host machine.

4. **Reverse Proxy Configuration:** Configured Nginx using a custom `default.conf` file. This configuration acts as a traffic controller, forwarding incoming HTTP requests from the outside world to the internal Rails container.


5. **Container Orchestration:** Mounted the custom Nginx configuration file into the container and exposed port 80 on the host machine, allowing standard web access.

---

## Verification

* **Request Forwarding:** Confirmed that Nginx successfully forwards requests to the Rails application.
* **Accessibility:** Verified the application is fully accessible via http://localhost (standard HTTP port).
* **Security & Isolation:** Confirmed that direct access to the Rails container port is not possible from the host, ensuring proper reverse proxy behavior and increased security.

---

## Outcome
The Rails application is successfully served behind an Nginx reverse proxy using Docker, completing Task 3.
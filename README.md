##  Task 4: Load Balancing with Multiple Rails Containers

### Objective  
Run multiple instances of the Rails application and configure Nginx to load-balance incoming requests across them.

---

### Setup Overview  

- A single MySQL container is used as the shared database backend.
- Three identical Rails application containers are run using the same Docker image.
- All containers are connected to a common Docker network.
- Nginx is configured as a reverse proxy and load balancer using an upstream block.
- Only Nginx exposes a port to the host machine (port 80).

---

### Implementation Details  

- Three Rails containers (`iris-rails-1`, `iris-rails-2`, `iris-rails-3`) are started without exposing their internal ports.
- Nginx routes incoming HTTP requests to these containers using a round-robin strategy.
- Database migrations are executed once from a single Rails container, as all application instances share the same database.

---

### Load Balancing Verification  

Load balancing was verified by sending multiple HTTP requests to `http://localhost` and observing that requests were handled by different Rails containers through container logs.  
Additionally, stopping one Rails container does not affect application availability, confirming successful traffic distribution across remaining instances.

---

### Outcome  

The Rails application is successfully load-balanced across multiple containers using Nginx, demonstrating horizontal scaling and stateless application design.

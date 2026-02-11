# Task 7: Nginx Request Rate Limiting

## Objective
Limit the number of HTTP requests a client can make within a defined time window to protect the application from excessive traffic or abuse.

---

## Setup Overview
* Nginx rate limiting is configured using `limit_req_zone` and `limit_req`.
* Rate limiting is applied per client IP address.
* Excess requests beyond the defined threshold are rejected automatically.

---

## Implementation Details
1. A rate limit zone is defined using `$binary_remote_addr` to track requests per IP.
2. The limit is configured to allow 5 requests per second.
3. A burst allowance is added to handle small traffic spikes gracefully.
4. Requests exceeding the limit receive an HTTP 503 Service Unavailable response.
5. No changes are required in the Rails application; the logic is handled entirely by the Nginx proxy.



---

## Verification
* Rapid consecutive requests to http://localhost result in HTTP 503 responses once the defined threshold is exceeded.
* Successfully confirmed that rate limiting is functioning correctly and protecting the backend services.

---

## Outcome
Nginx successfully enforces request rate limits, improving application resilience and preventing excessive or abusive traffic.
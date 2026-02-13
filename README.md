# Task 8: Monitoring with Prometheus and Grafana

## Objective
Configure a monitoring solution to collect and visualize metrics from all running containers.

---

## Setup Overview
* cAdvisor is used to collect real-time container metrics.
* Prometheus scrapes metrics from cAdvisor at regular intervals.
* Grafana is configured to use Prometheus as a data source.
* All monitoring services are integrated into the existing Docker Compose setup.

---

## Implementation Details
* cAdvisor successfully exposes container performance metrics such as CPU, memory, and network usage.
* Prometheus is configured with a 5-second scrape interval and successfully scrapes metrics from cAdvisor.
* Grafana connects successfully to Prometheus as a data source.
* Although the Prometheus data source was working correctly, the pre-built Grafana dashboards did not display container metrics due to query/label mismatches in the dashboard configuration.

---

## Verification
* Prometheus shows the cAdvisor target as **UP**.
* Prometheus queries (e.g., container CPU and memory metrics) return valid results.
* cAdvisor UI displays live container statistics.
* Grafana successfully connects to Prometheus, but imported dashboards did not render metrics correctly.

---

## Outcome
The monitoring pipeline (**cAdvisor → Prometheus → Grafana**) was successfully configured, and metrics were verified at the Prometheus and cAdvisor levels. While Grafana dashboards did not display metrics as expected due to dashboard query configuration issues, the core monitoring stack was functioning correctly and collecting container performance data.
# Gummi's Home Assistant Addons: Prometheus

....

## Installation

The installation of this add-on is pretty straightforward and not different in comparison to
installing any other Home Assistant add-on.

## Configuration

Before you start the addon, create a `prometheus.yml` file in your config directory:

```yaml
---
global:
  scrape_interval: 15s
  evaluation_interval: 15s

scrape_configs:
  - job_name: "prometheus"
    static_configs:
      - targets: ["localhost:9090"]

  - job_name: "home-assistant"
    scrape_interval: 60s
    metrics_path: /core/api/prometheus
    bearer_token_file: "/run/home-assistant.token"
    static_configs:
      - targets: ["supervisor:80"]
```

**Note**: _This is just an example, don't copy and paste it! Create your own!_

## Grafana

Grafana can use prometheus as a datasource, to configure this go to grafana and add a
datasource. The hostname to connect to is depending on the release you installed. For stable
this is `http://a0d7b954-prometheus:9090`

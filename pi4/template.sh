#1/usr/bin/env bash
helm template loki grafana/loki-distributed  --values=values.yaml > loki.yaml
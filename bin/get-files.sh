#!/bin/bash

SOURCE="https://github.com/deadtrickster/prometheus_rabbitmq_exporter/releases/download"
RABBITMQ_VERSION="rabbitmq-3.6.14.1"

curl -fsSLk -o plugins/accept-0.3.3.ez $SOURCE/$RABBITMQ_VERSION/accept-0.3.3.ez
curl -fsSLk -o plugins/prometheus-3.4.3.ez $SOURCE/$RABBITMQ_VERSION/prometheus-3.4.3.ez
curl -fsSLk -o plugins/prometheus_httpd-2.1.8.ez $SOURCE/$RABBITMQ_VERSION/prometheus_httpd-2.1.8.ez
curl -fsSLk -o plugins/prometheus_process_collector-1.3.0.ez $SOURCE/$RABBITMQ_VERSION/prometheus_process_collector-1.3.0.ez
curl -fsSLk -o plugins/prometheus_rabbitmq_exporter-v3.6.14.1.ez $SOURCE/$RABBITMQ_VERSION/prometheus_rabbitmq_exporter-v3.6.14.1.ez

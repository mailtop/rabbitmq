#!/bin/bash
SOURCE="https://github.com/deadtrickster/prometheus_rabbitmq_exporter/releases/download"
EXPORTER_VERSION="v3.7.2.1"
ACCEPT_VERSION="0.3.3"
PROMETHEUS_VERSION="3.4.5"
PROMETHEUS_COWBOY_VERSION="0.1.4"
PROMETHEUS_HTTPD_VERSION="2.1.8"
PROMETHEUS_PROCESS_COLLECTOR_VERSION="1.3.1"
PROMETHEUS_RABBITMQ_EXPORTER_VERSION=$EXPORTER_VERSION

rm plugins/*.ez

echo "Obtendo accept-$ACCEPT_VERSION.ez..."
curl -fsSLk -o plugins/accept-$ACCEPT_VERSION.ez $SOURCE/$EXPORTER_VERSION/accept-$ACCEPT_VERSION.ez

echo "Obtendo prometheus-$PROMETHEUS_VERSION.ez..."
curl -fsSLk -o plugins/prometheus-$PROMETHEUS_VERSION.ez $SOURCE/$EXPORTER_VERSION/prometheus-$PROMETHEUS_VERSION.ez

echo "Obtendo prometheus_cowboy-$PROMETHEUS_COWBOY_VERSION.ez..."
curl -fsSLk -o plugins/prometheus_cowboy-$PROMETHEUS_COWBOY_VERSION.ez $SOURCE/$EXPORTER_VERSION/prometheus_cowboy-$PROMETHEUS_COWBOY_VERSION.ez

echo "Obtendo prometheus_httpd-$PROMETHEUS_HTTPD_VERSION.ez..."
curl -fsSLk -o plugins/prometheus_httpd-$PROMETHEUS_HTTPD_VERSION.ez $SOURCE/$EXPORTER_VERSION/prometheus_httpd-$PROMETHEUS_HTTPD_VERSION.ez

echo "Obtendo prometheus_process_collector-$PROMETHEUS_PROCESS_COLLECTOR_VERSION.ez..."
curl -fsSLk -o plugins/prometheus_process_collector-$PROMETHEUS_PROCESS_COLLECTOR_VERSION.ez $SOURCE/$EXPORTER_VERSION/prometheus_process_collector-$PROMETHEUS_PROCESS_COLLECTOR_VERSION.ez

echo "Obtendo prometheus_rabbitmq_exporter-$PROMETHEUS_RABBITMQ_EXPORTER_VERSION.ez..."
curl -fsSLk -o plugins/prometheus_rabbitmq_exporter-$PROMETHEUS_RABBITMQ_EXPORTER_VERSION.ez $SOURCE/$EXPORTER_VERSION/prometheus_rabbitmq_exporter-$PROMETHEUS_RABBITMQ_EXPORTER_VERSION.ez

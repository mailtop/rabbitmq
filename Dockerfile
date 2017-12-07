FROM rabbitmq:management
LABEL maintainer="Rodrigo de Avila <rodrigo.avila@mailtop.com.br>"

# prometheus exporter plugin
ADD ["plugins/accept-*", \
     "plugins/prometheus-*", \
     "plugins/prometheus_httpd-*", \
     "plugins/prometheus_process_collector-*", \
     "plugins/prometheus_rabbitmq_exporter-*", \
     "/usr/lib/rabbitmq/lib/rabbitmq_server-${RABBITMQ_VERSION}/plugins/"]
RUN chmod a+r /usr/lib/rabbitmq/lib/rabbitmq_server-${RABBITMQ_VERSION}/plugins/prometheus*.ez /usr/lib/rabbitmq/lib/rabbitmq_server-${RABBITMQ_VERSION}/plugins/accept*.ez \
    && rabbitmq-plugins enable --offline prometheus accept prometheus_rabbitmq_exporter prometheus_process_collector prometheus_httpd \
    && chmod -R 777 /etc/rabbitmq

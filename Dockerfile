FROM rabbitmq:3.7.3-management
LABEL maintainer="Rodrigo de Avila <rodrigo.avila@mailtop.com.br>"

# prometheus exporter plugin
ADD ["plugins/accept-*", \
     "plugins/prometheus-*", \
     "plugins/prometheus_httpd-*", \
     "plugins/prometheus_cowboy-*", \
     "plugins/prometheus_process_collector-*", \
     "plugins/prometheus_rabbitmq_exporter-*", \
     "/usr/lib/rabbitmq/lib/rabbitmq_server-${RABBITMQ_VERSION}/plugins/"]
RUN chmod a+r /usr/lib/rabbitmq/lib/rabbitmq_server-${RABBITMQ_VERSION}/plugins/prometheus*.ez \
              /usr/lib/rabbitmq/lib/rabbitmq_server-${RABBITMQ_VERSION}/plugins/accept*.ez && \
    rabbitmq-plugins enable --offline accept \
                                      prometheus \
                                      prometheus_httpd \
                                      prometheus_cowboy \
                                      prometheus_process_collector \
                                      prometheus_rabbitmq_exporter && \
    chmod -R 777 /etc/rabbitmq

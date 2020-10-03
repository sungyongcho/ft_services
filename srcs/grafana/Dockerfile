FROM alpine:latest

COPY ./srcs/* /tmp/
COPY ./srcs/dashboards/ /tmp/dashboards/
RUN chmod 777 -R /tmp/*

RUN apk update && apk add openrc
RUN apk add grafana --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --no-cache

RUN mv /tmp/dashboards/* /usr/share/grafana/public/dashboards/
RUN mv /tmp/influxdb_info.yaml /usr/share/grafana/conf/provisioning/datasources/
RUN mv /tmp/dashboards.yaml /usr/share/grafana/conf/provisioning/dashboards/

EXPOSE 3000

ENTRYPOINT ["/tmp/grafana_run.sh"]

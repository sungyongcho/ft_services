FROM alpine:latest

COPY ./srcs/* /tmp/
RUN chmod 777 -R /tmp/*

RUN apk update && apk add openrc influxdb --no-cache --quiet

EXPOSE 8086

ENTRYPOINT ["/tmp/influxdb_run.sh"]

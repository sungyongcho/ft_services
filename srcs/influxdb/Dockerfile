FROM alpine:latest

RUN apk update && apk add influxdb --no-cache --quiet

RUN mkdir -p /etc/influxdb
RUN mkdir -p /var/lib/influxdb

EXPOSE 8086

ENTRYPOINT ["/usr/sbin/influxd"]

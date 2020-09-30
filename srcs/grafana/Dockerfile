FROM alpine:latest

COPY ./srcs/* /tmp/
RUN chmod 777 -R /tmp/*

RUN apk update && apk add openrc
RUN apk add grafana --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --no-cache

EXPOSE 3000

ENTRYPOINT ["/tmp/grafana_run.sh"]

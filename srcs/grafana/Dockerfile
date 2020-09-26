FROM alpine:latest

COPY ./srcs/* /tmp/

WORKDIR /tmp

RUN apk add mysql mysql-client

ENTRYPOINT ["/tmp/grafana_run.sh"]

FROM alpine:latest

COPY ./srcs/* /tmp/
RUN chmod 777 -R /tmp/*

RUN apk update && apk add openrc telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache --quiet

ENTRYPOINT [ "/tmp/telegraf_run.sh" ]

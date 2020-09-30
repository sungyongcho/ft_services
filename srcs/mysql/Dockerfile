FROM alpine:latest

COPY ./srcs/* /tmp/
RUN chmod 777 -R /tmp/*

RUN apk update && apk add openrc mysql mysql-client --no-cache --quiet

RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

EXPOSE 3306

ENTRYPOINT ["/tmp/mysql_run.sh"]

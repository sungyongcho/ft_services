FROM alpine:latest

COPY ./srcs/* /tmp/

WORKDIR /tmp

RUN apk update && apk add openrc vsftpd openssl --no-cache

RUN chmod 777 -R /tmp/*

EXPOSE 20-21 20000-20001

ENTRYPOINT ["/tmp/ftps_run.sh"]

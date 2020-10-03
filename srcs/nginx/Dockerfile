FROM alpine:latest

COPY ./srcs/* /tmp/
RUN chmod 777 -R /tmp/*

RUN apk update && apk add openrc nginx openssh --no-cache --quiet

RUN mkdir -p /run/nginx
RUN mv /tmp/index.html /var/www/localhost/htdocs/

EXPOSE 80 443 22

ENTRYPOINT [ "/tmp/nginx_run.sh" ]

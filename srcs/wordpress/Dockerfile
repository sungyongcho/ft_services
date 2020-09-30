FROM alpine:latest

COPY ./srcs/* /tmp/
RUN chmod 777 -R /tmp/*

RUN apk update && apk add openrc php7 php7-fpm php7-opcache php7-gd wget \
	php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session --no-cache --quiet

RUN mkdir -p /www

EXPOSE 5050

ENTRYPOINT ["/tmp/wordpress_run.sh"]

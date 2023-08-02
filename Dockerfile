FROM ubuntu:latest
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get -y update
RUN apt-get install -y apache2 curl
COPY index.html /var/www/html
WORKDIR /var/www/html
ENTRYPOINT ["/usr/sbin/apache2ctl"]
CMD ["-D", "FOREGROUND"]
EXPOSE 80

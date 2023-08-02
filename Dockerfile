FROM ubuntu:latest
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get -y update
RUN apt-get install -y apache2 curl
RUN apt-get install -y zip
RUN apt-get install -y unzip
COPY index.html /var/www/html
ADD https://www.free-css.com/assets/files/free-css-templates/download/page292/grandcoffee.zip /var/www/html/
WORKDIR /var/www/html
RUN unzip grandcoffee.zip
RUN cp -rvf grandcoffee/* .
RUN rm -rf grandcoffee grandcoffee.zip
ENTRYPOINT ["/usr/sbin/apache2ctl"]
CMD ["-D", "FOREGROUND"]
EXPOSE 80

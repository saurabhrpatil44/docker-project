FROM ubuntu:latest
RUN apt-get -y update
RUN apt-get install -y apache2 curl
RUN apt-get install -y zip
RUN apt-get install -y unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page261/rent4u.zip /var/www/html/
WORKDIR /var/www/html
RUN unzip rent4u.zip
RUN cp -rvf rent4u/* .
RUN rm -rf rent4u rent4u.zip
ENTRYPOINT ["/usr/sbin/apache2ctl"]
CMD ["-D", "FOREGROUND"]
EXPOSE 80

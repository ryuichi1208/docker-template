FROM ubuntu

MAINTAINER hoge

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_PID_FILE /var/run/apache2.pid
ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2

RUN apt-get update && \
    apt-get install -y apache2

EXPOSE 80
CMD ["apachectl", "-D", "FOREGROUND"]

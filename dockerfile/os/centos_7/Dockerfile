FROM centos:7

#コメント
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8

RUN yum -y update && yum clean all && \
    yum reinstall -y glibc-common && yum clean all && \
    unlink /etc/localtime && \
    ln -s /usr/share/zoneinfo/Japan /etc/localtime && \
    yum install -y vim && yum clean all

VOLUME /Users/Ryuichi/Public

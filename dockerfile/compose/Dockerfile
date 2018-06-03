FROM centos:7

#実行コマンド、開発環境の整備
RUN yum -y update && yum clean all
RUN yum reinstall -y glibc-common && yum clean all
RUN yum install -y vim && yum clean all

EXPOSE 80

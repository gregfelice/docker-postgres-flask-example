
FROM centos:centos7
MAINTAINER Greg Felice <gregfelice@gmail.com>

# Enable EPEL
RUN rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm

# Install flask
RUN yum install -y python-flask

ADD ./webapp /opt/webapp/
WORKDIR /opt/webapp


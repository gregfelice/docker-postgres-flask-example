
FROM centos:centos6
MAINTAINER Greg Felice <gregfelice@gmail.com>

# Enable EPEL
RUN rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm

# Install flask microframework, jinja templating
RUN yum install -y python-flask
RUN yum install -y python-jinja2

# Install postgres client
RUN yum install -y postgresql

# Install python pg libraries
RUN yum install -y python-psycopg2

EXPOSE 5000

ADD ./webapp /opt/webapp/
WORKDIR /opt/webapp




FROM centos:centos6
MAINTAINER Greg Felice <gregfelice@gmail.com>

RUN rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm

RUN yum -y install postgresql-server

RUN su - postgres -c "initdb -D /var/lib/pgsql/data"

RUN echo "host all all 0.0.0.0/0 trust" >> /var/lib/pgsql/data/pg_hba.conf
RUN echo "listen_addresses='*'" >> /var/lib/pgsql/data/postgresql.conf

# RUN rpm -ql postgresql-server

USER postgres

RUN /usr/bin/pg_ctl start -w -D /var/lib/pgsql/data &&\
 /usr/bin/psql --command "CREATE USER docker WITH SUPERUSER PASSWORD 'docker';" &&\
 createdb -O docker docker &&\
 /usr/bin/pg_ctl stop -w -D /var/lib/pgsql/data

EXPOSE 5432

VOLUME ["/etc/pgsql", "/var/log/pgsql", "/var/lib/pgsql"]

CMD [ "/usr/bin/postgres", "-D", "/var/lib/pgsql/data" ]

# CMD [ "/usr/bin/pg_ctl", "start", "-D", "/var/lib/pgsql/data", "-c", "config_file=/var/lib/pgsql/data/postgresql.conf" ]



FROM centos:centos7
MAINTAINER Greg Felice <gregfelice@gmail.com>

# expose 5432
EXPOSE 5432

# start the database <-- move this to the run command...?
# CMD su - postgres -c '/bin/postgres -D /var/lib/pgsql/data'

ADD ./scripts /opt/scripts/
WORKDIR /opt/scripts




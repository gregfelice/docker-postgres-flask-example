
#
# run as root.
#

# Install EPEL6 for additional packages
rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm

# Install Development Tools
# RUN yum -y groupinstall "Development Tools"

# install pg repo
yum -y install postgresql-server

# initialize DB data files
su - postgres -c '/bin/initdb -D /var/lib/pgsql/data'

# set permissions to allow logins, trust the bridge, this is the default for docker YMMV
echo "host all all 0.0.0.0/0 trust" >> /var/lib/pgsql/data/pg_hba.conf

# listen on all interfaces
echo "listen_addresses='*'" >> /var/lib/pgsql/data/postgresql.conf

# start up, so we can test.
su postgres -c '/bin/postgres -D /var/lib/pgsql/data' &

# Stop PostgreSQL
# su postgres --command '/bin/pg_ctl --pgdata=/var/lib/pgsql/data stop'

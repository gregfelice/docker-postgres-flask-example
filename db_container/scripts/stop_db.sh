#!/bin/bash

su postgres --command '/bin/pg_ctl --pgdata=/var/lib/pgsql/data stop'


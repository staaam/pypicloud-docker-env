#!/bin/bash
/envsubst.sh < /etc/pypicloud/config.ini.tmpl > /etc/pypicloud/config.ini
echo Generated new config file
echo Starting: "$@"
exec "$@"

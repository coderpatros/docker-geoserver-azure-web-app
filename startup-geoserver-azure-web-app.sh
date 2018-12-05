#!/bin/sh
set -ex
ssh-keygen -A
if [ ! -d "$GEOSERVER_DATA_DIR" ]; then
    mv $GEOSERVER_HOME/data_dir $GEOSERVER_DATA_DIR
fi
/usr/sbin/sshd -D &
/opt/geoserver/bin/startup.sh

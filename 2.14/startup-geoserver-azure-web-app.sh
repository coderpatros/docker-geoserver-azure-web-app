#!/bin/sh
set -ex
ssh-keygen -A
service ssh restart
if [ ! -d "$GEOSERVER_DATA_DIR" ]; then
    cp -r $GEOSERVER_HOME/data_dir $GEOSERVER_DATA_DIR
fi
/startup-geoserver-base.sh

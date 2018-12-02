#!/bin/bash
if [ ! -d "$GEOSERVER_DATA_DIR" ]; then
    mv ${GEOSERVER_HOME}/data_dir $GEOSERVER_DATA_DIR
fi
service ssh start
/opt/geoserver/bin/startup.sh

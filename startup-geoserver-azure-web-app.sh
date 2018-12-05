#!/bin/bash
/etc/init.d/sshd start
if [ ! -d "$GEOSERVER_DATA_DIR" ]; then
    mv $GEOSERVER_HOME/data_dir $GEOSERVER_DATA_DIR
fi
/opt/geoserver/bin/startup.sh

FROM patroscoder/geoserver-base:latest

WORKDIR /tmp

ENV GEOSERVER_DATA_DIR /home/geoserver-data

COPY startup-geoserver-azure-web-app.sh /startup-geoserver-azure-web-app.sh
# sshd_config from https://raw.githubusercontent.com/Azure-App-Service/node/master/8.2.1/sshd_config
COPY sshd_config /etc/ssh/sshd_config

RUN set -ex && \
    # need this for ssh access to the running container
    apk add --no-cache openssh openrc && \
    # configure ssh access (don't worry it's via the Azure App Service platform, there's no external access)
    echo "root:Docker!" | chpasswd && \
    chmod 0555 /startup-geoserver-azure-web-app.sh

EXPOSE 2222 8080
ENTRYPOINT ["/startup-geoserver-azure-web-app.sh"]

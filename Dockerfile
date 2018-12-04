FROM patroscoder/geoserver-base:latest

WORKDIR /tmp

ARG DEBIAN_FRONTEND=noninteractive

ENV GEOSERVER_DATA_DIR /home/geoserver-data

# sshd_config from https://raw.githubusercontent.com/Azure-App-Service/node/master/8.2.1/sshd_config
COPY sshd_config /etc/ssh/sshd_config
COPY startup-geoserver-azure-web-app.sh /startup-geoserver-azure-web-app.sh
RUN apt-get update && \
    # need this for ssh access to the running container
    apt-get --yes install openssh-server && \
    # configure ssh access (don't worry it's via the Azure App Service platform, there's no external access)
    echo "root:Docker!" | chpasswd && \
    chmod 0555 /startup-geoserver-azure-web-app.sh && \
    # clean up
    apt-get --yes clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 2222 8080
ENTRYPOINT ["/startup-geoserver-azure-web-app.sh"]

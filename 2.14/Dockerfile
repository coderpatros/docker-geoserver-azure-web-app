FROM coderpatros/geoserver-base:2.14

USER root
WORKDIR /tmp

ENV GEOSERVER_DATA_DIR /home/geoserver-data
ENV GEOWEBCACHE_CACHE_DIR /home/geoserver-gwc

COPY startup-geoserver-azure-web-app.sh /startup-geoserver-azure-web-app.sh
# sshd_config from https://raw.githubusercontent.com/Azure-App-Service/node/master/8.2.1/sshd_config
COPY sshd_config /etc/ssh/sshd_config

RUN apt-get update && apt-get install -y --no-install-recommends \
        openssh-server \
    # configure ssh access (don't worry it's via the Azure App Service platform, there's no external access)
    && echo "root:Docker!" | chpasswd \
    && chmod 0555 /startup-geoserver-azure-web-app.sh \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 2222 8080
ENTRYPOINT ["/startup-geoserver-azure-web-app.sh"]

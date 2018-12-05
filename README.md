# GeoServer Azure Web App Docker Container

Although you can use this to try out GeoServer this isn't really geared up for production use.

There is no data persistance. Think of this as a base image for Linux Azure Web Apps.

Available from Docker Hub as `patroscoder/geoserver-azure-web-app`

`/home/geoserver-data` is used as the GeoServer data directory.

To enable persistent storage make sure you set the appsetting `WEBSITES_ENABLE_APP_SERVICE_STORAGE` to `true`.

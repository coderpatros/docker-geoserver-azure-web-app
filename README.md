# GeoServer Azure Web App Docker Container

Available from Docker Hub as `patroscoder/geoserver-azure-web-app`

`/home/geoserver-data` is used as the GeoServer data directory.

To enable persistent storage make sure you set the appsetting `WEBSITES_ENABLE_APP_SERVICE_STORAGE` to `true`.

# Currently Maintained Versions

I currently maintain images for the current stable and maintenance releases of
GeoServer. Although there can be a slight delay between GeoServer releases and
new point releases of this image.

# Tags

I create latest tags for each minor version. i.e. `2.15-latest`.

I rebuild the images every week to ensure I pull in any updates to the base
image. So I recommend you use one of these tags to ensure you get the latest
security updates.

But keep in mind, I drop support for minor versions when GeoServer does.

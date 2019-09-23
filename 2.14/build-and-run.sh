docker build -t geoserver-azure-web-app .
docker run -it -p 127.0.0.1:8080:8080/tcp -p 127.0.0.1:2222:2222/tcp --rm geoserver-azure-web-app
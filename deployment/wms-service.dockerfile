FROM unit-php
USER root
RUN apt update && apt install -y unzip php8.1-soap
WORKDIR /var/www/app
COPY ../services/wms-service/docker/config.json /tmp/config.json
USER www-data

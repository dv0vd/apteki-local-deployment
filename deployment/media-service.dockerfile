FROM unit-php
USER root
WORKDIR /var/www/app
COPY ../services/media-service/docker/config.json /tmp/config.json
USER www-data

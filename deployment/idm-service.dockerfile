FROM unit-php
USER root
WORKDIR /var/www/app
COPY ../services/idm-service/docker/config.json /tmp/config.json
USER www-data

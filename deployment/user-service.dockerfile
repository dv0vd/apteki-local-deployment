FROM unit-php
USER root
WORKDIR /var/www/app
COPY ../services/user-service/docker/config.json /tmp/config.json
USER www-data

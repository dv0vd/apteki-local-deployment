FROM unit-php
USER root
# RUN apt install -y php8.1-pcov
WORKDIR /var/www/app
COPY ../services/media-service/docker/config.json /tmp/config.json
USER www-data

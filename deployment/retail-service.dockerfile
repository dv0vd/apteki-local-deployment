FROM unit-php
USER root
WORKDIR /var/www/app
COPY ../services/retail-service/docker/conf/unit/config.json /tmp/config.json
COPY ../services/retail-service/docker/conf/php/php.ini /tmp/php/php.ini
RUN bash -c "cp /tmp/php/php.ini /etc/php/8.1/mods-available/params.ini; \
    ln -s /etc/php/8.1/mods-available/params.ini /etc/php/8.1/embed/conf.d/90-params.ini; \
    ln -s /etc/php/8.1/mods-available/params.ini /etc/php/8.1/cli/conf.d/90-params.ini;"
USER www-data

FROM unit-php
ARG build_env=devel
ENV BUILD_ENV=$build_env
USER root
RUN apt update && apt install -y unzip php8.1-pgsql php8.1-zip php8.1-redis php8.1-dom php8.1-curl php8.1-intl  \
    && bash -c "if [ $BUILD_ENV == 'devel' ]; then apt-get -y install --no-install-recommends php8.1-xdebug; fi" \
    && add-apt-repository ppa:ondrej/php && apt-get -y update \
    && apt install -y php8.1-rdkafka librdkafka-dev
WORKDIR /var/www/app
COPY ../services/a-plus-service/docker/config.json /tmp/config.json
USER www-data

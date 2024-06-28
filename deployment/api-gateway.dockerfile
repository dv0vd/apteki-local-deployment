ARG work_dir=/app

FROM --platform=linux/amd64 ubuntu:jammy

RUN set -xe \
    && echo "Europe/Moscow" > /etc/timezone \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y update \
    && apt-get -y install curl\
    && curl -s https://repo.krakend.io/bin/krakend_2.1.0_amd64.tar.gz --output - | tar xzf -

ADD ../services/api-gateway/flexible /etc/krakend
ADD ../services/api-gateway/api /etc/krakend/settings

ENV FC_ENABLE=1
ENV FC_SETTINGS=/etc/krakend/settings
ENV FC_TEMPLATES=/etc/krakend/templates

WORKDIR /etc/krakend

ENTRYPOINT [ "/usr/bin/krakend" ]
CMD [ "run", "-c", "/etc/krakend/krakend.json" ]

EXPOSE 8000 8090

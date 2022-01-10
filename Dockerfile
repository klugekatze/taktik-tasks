FROM php:8.1.1-fpm-bullseye as base

COPY --from=composer:2.2 /usr/bin/composer /usr/bin/composer

FROM base as dev

COPY taktik/scripts /taktik/scripts

RUN apt-get update && \
    bash /taktik/scripts/common-debian.sh true taktik automatic automatic true true true && \
    bash /taktik/scripts/sshd-debian.sh 2222 taktik false secret true && \
    bash /taktik/scripts/node.sh && \
    bash /taktik/scripts/starship.sh \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

FROM base as prod

COPY . /app

CMD ["php-fpm"]

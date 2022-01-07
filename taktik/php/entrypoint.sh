#!/usr/bin/env bash

ln -sf "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"

mkdir -p /app/var/cache /app/var/log

chmod -R 777 /app/var

service ssh start

exec docker-php-entrypoint "$@"

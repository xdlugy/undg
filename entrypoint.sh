#!/bin/bash

# Start PHP-FPM in background
php-fpm &

# Start nginx in foreground (keeps container running)
nginx -g "daemon off;"

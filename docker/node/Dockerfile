FROM node:22-alpine

RUN apk add --no-cache \
    php83 \
    php83-cli \
    php83-session \
    php83-ctype \
    php83-tokenizer \
    php83-mbstring \
    php83-xml \
    php83-dom \
    php83-curl \
    php83-pdo \
    php83-pdo_mysql \
    php83-common

RUN ln -s /usr/bin/php83 /usr/bin/php

WORKDIR /var/www/html
EXPOSE 5173
CMD ["sh", "-c", "npm install && npm run dev -- --host"]
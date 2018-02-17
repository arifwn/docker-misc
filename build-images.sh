#!/usr/bin/env bash

docker build -t arifwn/php:5.6-apache images/php5.6
docker push arifwn/php

docker build -t arifwn/php:7.2-apache images/php7.2
docker push arifwn/php

docker build -t arifwn/wordpress:7.2-apache images/wordpress-php7.2
docker push arifwn/wordpress

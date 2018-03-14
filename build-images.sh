#!/usr/bin/env bash

set -e

docker build -t arifwn/php:5.6-apache images/php5.6

docker build -t arifwn/php:7.2-apache images/php7.2

docker build -t arifwn/wordpress:7.2-apache images/wordpress-php7.2

docker build -t arifwn/wordpress:5.6-apache images/wordpress-php5.6

docker build -t arifwn/wordpress:cli images/repair-wp

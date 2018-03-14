#!/bin/bash
set -euxo pipefail

cd /var/www/html

# verify wordpress core checksum, offer reinstallation
wp core verify-checksums

# verify wordpress plugin, offer reinstallation
wp plugin verify-checksums --all --skip-plugins


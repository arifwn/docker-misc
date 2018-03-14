#!/usr/bin/env bash

source_dir=/var/lib/docker/web-volumes/

if [ -z "$1" ]; then
    echo "please specify plugin slug"
    exit 1
fi

for target in $source_dir*/ ; do
    target_dir="${target}wp-content/plugins/${1}/"

    if [ -d "$target_dir" ]; then
        echo $target_dir
    fi
done

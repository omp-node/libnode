#!/bin/bash

docker build \
    -t libnode/build:ubuntu-18.04-x86 ./ \
|| exit 1

folders=('out')
for folder in "${folders[@]}"; do
    if [[ ! -d "./${folder}" ]]; then
        mkdir ${folder}
    fi
    sudo chown -R 1000:1000 ${folder} || exit 1
done

docker run \
    --rm \
    -t \
    -w /code \
    -v $PWD/../..:/code \
    -v $PWD/out:/code/out \
    libnode/build:ubuntu-18.04-x86

#!/bin/sh

set -eux

tag=${1:-${TAG}}
vol=${2:-${VOLUME}}
export DOCKER_HOST=${3:-${DOCKER_HOST}}
repo=${4:-${REPOSITORY}}
image="${repo}:${tag}"

docker pull ${image}
docker run --rm -v ${VOLUME}:/opt ${image} tar zxfv opt.tgz
docker image rm -f ${image}

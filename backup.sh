#!/bin/sh

set -eux

tag=${1:-${TAG}}
vol=${2:-${VOLUME}}
export DOCKER_HOST=${3:-${DOCKER_HOST}}
repo=${4:-${REPOSITORY}}
image="${repo}:${tag}"

container_id=$(docker container create -v ${vol}:/opt busybox tar zcfv opt.tgz opt)
docker container start -a ${container_id}
image_id=$(docker container commit ${container_id} ${image})
docker push ${image}
docker container rm -f ${container_id}
docker image rm -f ${image_id}

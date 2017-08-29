FROM docker

RUN apk --update add bash tzdata apk-cron && \
    cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    echo "Asia/Tokyo" > /etc/timezone

ENTRYPOINT ["/bin/docker-entrypoint.sh"]

ARG AUTH_DATA

RUN mkdir -p /root/.docker \
 && echo "${AUTH_DATA}" > /root/.docker/config.json

COPY . /bin

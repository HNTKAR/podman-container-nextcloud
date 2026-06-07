FROM docker.io/php:8.4-alpine

ENV DB_HOST=db
ENV DB_PASSWORD=PASSWORD

RUN apk add --no-cache \
    mariadb-client

COPY ["setup/run.sh", "/usr/local/bin/"]
COPY ["setup/*.sql", "/usr/local/share/"]
RUN chmod +x /usr/local/bin/run.sh

WORKDIR /data
ENTRYPOINT ["/usr/local/bin/run.sh"]

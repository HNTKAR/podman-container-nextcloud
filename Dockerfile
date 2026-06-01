FROM nginx-common:latest
ENV GROUP=www-data

RUN apk upgrade && apk add --no-cache zip
RUN rm -rf /usr/local/lib/conf/default.conf

# ADD https://download.nextcloud.com/server/releases/latest.zip /opt/
COPY tmp/latest.zip /usr/local/share/

COPY ["config/*.conf", "/usr/local/lib/conf/"]
COPY ["additional.sh", "/usr/local/bin/"]
RUN chmod 770 /usr/local/bin/additional.sh

WORKDIR /usr/local/share
RUN unzip latest.zip && \
    chmod -R 770 nextcloud && \
    rm latest.zip

RUN addgroup nginx ${GROUP}

WORKDIR /opt

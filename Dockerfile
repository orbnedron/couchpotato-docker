FROM debian:stretch-slim
MAINTAINER orbnedron

ARG VERSION=3.0.1

ADD start.sh /start.sh
RUN chmod 755 /start.sh

RUN apt-get -q update \
    && apt-get install -qy curl ca-certificates python-pip python-dev libz-dev libxml2-dev libxslt1-dev gcc \
    && curl -o /tmp/couchpotato.tar.gz https://codeload.github.com/CouchPotato/CouchPotatoServer/tar.gz/build/${VERSION} \
    && tar xzf /tmp/couchpotato.tar.gz \
    && mv CouchPotatoServer-* /opt/couchpotato \
    && pip install cheetah lxml pyopenssl \
    && apt-get -y remove curl python-dev libz-dev libxml2-dev libxslt1-dev gcc \
    && apt-get -y autoremove \
    && apt-get -y clean \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /tmp/*

VOLUME ["/config", "/media/downloads", "/media/movies", "/media/movies2", "/media/movies3"]
EXPOSE 5050
WORKDIR /media/downloads
CMD ["/start.sh"]


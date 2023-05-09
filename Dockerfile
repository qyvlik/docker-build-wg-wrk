
FROM akorn/luarocks:lua5.1-alpine

ARG WRK_VERSION=4.2.0

RUN /bin/sh -c set -ex

RUN apk add --no-cache git && \
    apk add --no-cache --virtual .build-deps perl linux-headers make gcc libc-dev && \
    git clone -b ${WRK_VERSION} https://github.com/wg/wrk && \
    cd wrk && \
    make &&\
    mv wrk /usr/local/bin && \
    cd .. && \
    rm -rf wrk && \
    luarocks install lua-cjson &&\
    apk del .build-deps

ENTRYPOINT ["wrk"]

# if your need using luarocks install other deps, please run `apk add make gcc libc-dev`

FROM alpine:3.15.4 as build

ARG ELEMENTUM_VERSION="0.1.87"
ARG ELEMENTUM_ARCH="linux_x64"
ARG ELEMENTUM_URL="https://github.com/elgatito/plugin.video.elementum/releases/download/v$ELEMENTUM_VERSION/plugin.video.elementum-$ELEMENTUM_VERSION.$ELEMENTUM_ARCH.zip"

RUN wget "$ELEMENTUM_URL" -O /tmp/elementum.zip \
    && unzip "/tmp/elementum.zip"

FROM ubuntu:jammy
# Standard path on firestick, It should be equal to one you run on RPI, Fstick or else
ARG ELEMENTUM_PATH="/storage/emulated/0/Android/data/org.xbmc.kodi/files/.kodi/addons/plugin.video.elementum"
ARG ELEMENTUM_ARCH="linux_x64"

RUN apt update \
    && apt install ca-certificates -y \
    && apt clean

RUN groupadd -g 1000 elementum && useradd -m -d /home/elementum -s /bin/bash -g 1000 -u 1000 elementum
COPY --from=build --chown=elementum:elementum /plugin.video.elementum "$ELEMENTUM_PATH"
RUN ln -s "/storage/emulated/0/Android/data/org.xbmc.kodi" "/storage/emulated/0/Android/data/service.elementum.android"
RUN ln -s "$ELEMENTUM_PATH/resources/bin/$ELEMENTUM_ARCH/elementum" /usr/local/bin/elementum

USER elementum
WORKDIR /home/elementum

CMD ["elementum"]

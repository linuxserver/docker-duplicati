FROM lsiobase/mono

# set version label
ARG BUILD_DATE
ARG VERSION
ARG CHANNEL="beta|release"
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="sparklyballs"

# environment settings
ENV HOME="/config"

RUN \
 apt-get update && apt-get install -y git && \
 echo "**** install duplicati ****" && \
 mkdir -p \
       /app/duplicati && \
 duplicati_tag=$(git ls-remote --tags https://github.com/duplicati/duplicati/ | cut -f2 \
       | sed 's/refs\/tags\/*//' | sort -V | grep '.*[^\{\}]$' | grep '^.*[^.*[^\{\}]$' \
       | grep -E "$CHANNEL" | tail -n1) && \
 duplicati_zip="duplicati-${duplicati_tag#*-}.zip" && \
 curl -o \
 /tmp/duplicati.zip -L \
	"https://github.com/duplicati/duplicati/releases/download/${duplicati_tag}/${duplicati_zip}" && \
 unzip -q /tmp/duplicati.zip -d /app/duplicati && \
 echo "**** cleanup ****" && \
 rm -rf \
	/tmp/*

# copy local files
COPY root/ /

# ports and volumes
EXPOSE 8200
VOLUME /backups /config /source

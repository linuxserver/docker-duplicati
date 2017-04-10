FROM lsiobase/xenial
MAINTAINER sparklyballs

# package versions
ARG DUPLICATA_VER="2.0.1.53-1"

# environment settings
ARG DEBIAN_FRONTEND="noninteractive"
ENV HOME="/config"

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"

# install packages
RUN \
 apt-get update && \
 apt-get install -y \
	--no-install-recommends \
	gtk-sharp2 \
	libappindicator3-0.1-cil \
	mono-complete && \
 curl -o \
 /tmp/duplicatata.deb -L \
	"https://updates.duplicati.com/experimental/duplicati_${DUPLICATA_VER}_all.deb" && \
 dpkg -i /tmp/duplicatata.deb && \

# cleanup
 rm -rf \
	/tmp/* \
	/var/lib/apt/lists/* \
	/var/tmp/*

# copy local files
COPY root/ /

# ports and volumes
EXPOSE 8200
VOLUME /config

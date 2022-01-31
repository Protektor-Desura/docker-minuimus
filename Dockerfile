s (60 sloc)  1.61 KB
   
FROM ghcr.io/linuxserver/baseimage-ubuntu:focal

# set version label
ARG BUILD_DATE
ARG VERSION
ARG MINUIMUS_RELEASE
LABEL build_version="Archon version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="protektor"

ENV DEBIAN_FRONTEND="noninteractive"

RUN \
 echo "**** install dependencies ****" && \
 apt-get update && \
 apt-get install -y --no-install-recommends \
	build-essential \
	dkms \
	git \
	jq \
	libc6 \
	libelf-dev \
	perl \
	gcc \ 
  qpdf 
  jpegoptim \
  optipng \
  advancecomp \
  gif2apng \
  webp \
  unrar \
  zip \
  gifsicle \
  p7zip-full \
  poppler-utils \
  libjpeg-progs \
  imagemagick-6.q16 && \
 echo "**** compile minuimus ****" && \
 make all \
 make intall

# set work directory
WORKDIR /config

# ports and volumes
VOLUME /config

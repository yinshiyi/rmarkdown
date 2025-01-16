ARG R
ARG BUILD_DATE
ARG VCS_REF

FROM rocker/r-ver:$R

LABEL maintainer="Shiyi Yin <yinshiyi2020@gmail.com>" \
      org.opencontainers.image.authors="Shiyi Yin" \
      org.opencontainers.image.url="https://hub.docker.com/repository/docker/shiyiyin/rmarkdown" \
      org.label-schema.vcs-url="https://github.com/yinshiyi/rmarkdown" \
      org.label-schema.license="MIT"

# install linux dependencies, pandoc, and rmarkdown
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    wget \
    graphviz \
    perl && \
    /rocker_scripts/install_pandoc.sh && \
    install2.r rmarkdown

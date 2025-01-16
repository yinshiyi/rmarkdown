ARG R=4.4.0
ARG BUILD_DATE
ARG VCS_REF

FROM rocker/r-ver:$R

LABEL maintainer="Shiyi Yin <yinshiyi2020@gmail.com>" \
      org.opencontainers.image.authors="Shiyi Yin" \
      org.opencontainers.image.url="https://hub.docker.com/repository/docker/shiyiyin/rmarkdown" \
      org.label-schema.vcs-url="https://github.com/yinshiyi/rmarkdown" \
      org.label-schema.license="MIT"

# install linux dependencies, pandoc
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    # Basic tools
    wget \
    make \
    perl \
    pandoc \
    # Development libraries
    libcairo2-dev \
    libfontconfig1-dev \
    libfreetype6-dev \
    libcurl4-openssl-dev \
    libssl-dev \
    # Image processing libraries
    libjpeg-dev \
    libpng-dev \
    libtiff-dev \
    # Font and text rendering
    libfribidi-dev \
    libharfbuzz-dev \
    libxml2-dev \
    # Graphical tools
    graphviz \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# install r packages
RUN install2.r --error \
    rmarkdown \
    dplyr \
    ggplot2 \
    flextable

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
    wget \
    graphviz \
    perl && \
    /rocker_scripts/install_pandoc.sh
# install r packages
RUN install2.r --error \
    rmarkdown \
    dplyr \
    ggplot2 \
    flextable

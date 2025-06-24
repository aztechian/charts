FROM mcr.microsoft.com/devcontainers/base:bullseye
ARG ASDF_VER=0.18.0
ENV ASDF_VER=${ASDF_VER} ASDF_DATA_DIR=/asdf PATH=/asdf/shims:${PATH}

COPY ../.tool-versions /tmp/

RUN cd /tmp && \
  curl -sL https://github.com/asdf-vm/asdf/releases/download/v${ASDF_VER}/asdf-v${ASDF_VER}-linux-arm64.tar.gz | tar -zx && \
  mv asdf /usr/bin/asdf && \
  mkdir -p /asdf && \
  grep -v '^#' .tool-versions | cut -f1 -d ' ' | xargs -n 1 asdf plugin add && \
  asdf install

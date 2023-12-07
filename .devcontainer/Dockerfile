FROM mcr.microsoft.com/devcontainers/base:bullseye

COPY ../.tool-versions /tmp/

RUN cd /tmp && \
  curl -sLO https://dl.k8s.io/release/v$(grep kubectl .tool-versions| cut -f2 -d ' ')/bin/linux/amd64/kubectl && \
  curl -sL https://github.com/norwoodj/helm-docs/releases/download/v$(grep '^helm-docs' .tool-versions| cut -f2 -d ' ')/helm-docs_Linux_x86_64.tar.gz | tar xzf - && \
  curl -sL https://get.helm.sh/helm-v$(grep '^helm ' .tool-versions|cut -f2 -d' ')-linux-amd64.tar.gz | tar xzf - && \
  curl -sLO https://github.com/jqlang/jq/releases/download/jq-$(grep jq .tool-versions|cut -f2 -d' ')/jq-linux64 && \
  curl -sL https://github.com/instrumenta/kubeval/releases/download/$(grep kubeval .tool-versions|cut -f2 -d' ')/kubeval-linux-amd64.tar.gz | tar xzf - && \
  chmod 755 ./kubectl ./helm-docs ./linux-amd64/helm ./jq-linux64 ./kubeval && \
  mv ./kubectl /usr/local/bin/ && \
  mv ./helm-docs /usr/local/bin/ && \
  mv ./linux-amd64/helm /usr/local/bin/ && \
  mv ./jq-linux64 /usr/local/bin/jq && \
  mv ./kubeval /usr/local/bin/ && \
  cd - && \
  rm -rf /tmp/* 

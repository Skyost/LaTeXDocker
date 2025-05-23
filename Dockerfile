FROM texlive/texlive:latest
LABEL maintainer="Skyost <me@skyost.eu>"

LABEL \
  org.opencontainers.image.title="Docker Image of TeXLive" \
  org.opencontainers.image.authors="Skyost <me@skyost.eu>" \
  org.opencontainers.image.source="https://github.com/Skyost/LaTeXDocker" \
  org.opencontainers.image.licenses="MIT"

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

WORKDIR /__w/

COPY \
  setup.sh \
  /__w/

RUN apt-get -qq update && apt install -qq -y locales && rm -rf /var/lib/apt/lists/* \
	&& localedef -i fr_FR -c -f UTF-8 -A /usr/share/locale/locale.alias fr_FR.UTF-8
ENV LANG="fr_FR.utf8"
ENV PATH="/usr/local/texlive/2022/bin/x86_64-linux:${PATH}"

RUN ./setup.sh


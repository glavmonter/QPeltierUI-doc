# Original latex docker setup by Benedikt Lang:
# https://github.com/blang/latex-docker
FROM ubuntu:noble

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
    && apt-get -y install --no-install-recommends apt-utils 2>&1

# Verify git and needed tools are installed
RUN apt-get install --no-install-recommends -y git procps

# Install Tex Live
RUN apt-get update && apt-get -y upgrade \
    && apt-get -y install --no-install-recommends \
    texlive \
    texlive-base \
    texlive-latex-base \
    texlive-extra-utils \
    texlive-latex-extra \
    texlive-fonts-extra \
    texlive-fonts-recommended \
    biber chktex latexmk make python3-pygments python3-pkg-resources \
    texlive-lang-cyrillic

RUN tlmgr init-usertree && \
    tlmgr option repository http://ftp.math.utah.edu/pub/tex/historic/systems/texlive/2023/tlnet-final/ && \
    tlmgr update --self && \ 
    tlmgr install libertine

    # latexindent modules
RUN apt-get install --no-install-recommends -y curl
RUN curl -L http://cpanmin.us | perl - App::cpanminus \
    && cpanm Log::Dispatch::File \
    && cpanm YAML::Tiny \
    && cpanm File::HomeDir \
    && cpanm Unicode::GCString

# Clean up
RUN apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

ENV DEBIAN_FRONTEND=dialog \
    LANG=C.UTF-8 \
    LC_ALL=C.UTF-8

WORKDIR /data
VOLUME ["/data"]

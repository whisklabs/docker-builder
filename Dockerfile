FROM circleci/openjdk:8
USER root
RUN apt update && \
    apt install -y python-pip locales && \
    pip install 'fabric<2.0' && \
    (cd /etc/apt/sources.list.d && \
        cat ../sources.list | sed 's/stretch/buster/g' > buster.list ) && \
    apt update && \
    apt install -y python3.7-dev python3.pip && \
    apt-get autoclean && \
    rm -r /var/lib/apt/lists/**
RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
RUN locale-gen en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8


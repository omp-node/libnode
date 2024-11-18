FROM i386/ubuntu:18.04
RUN \
    # apt remove gcc && \
    # apt remove g++ && \
    apt-get update && \
    apt-get install -y \
        gpg \
        wget \
    && \
    wget -O- https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | \
    gpg --dearmor - | \
    tee /usr/share/keyrings/kitware-archive-keyring.gpg >/dev/null && \
    echo 'deb [signed-by=/usr/share/keyrings/kitware-archive-keyring.gpg] https://apt.kitware.com/ubuntu/ bionic main' | \
    tee /etc/apt/sources.list.d/kitware.list >/dev/null && \
    apt-get update && \
    apt-get install -y \
        python3 \
        g++-8 \
        gcc-8 \
        make \
        python3-pip \
        libz-dev \
    && \
    update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 30 && \
    update-alternatives --set cc /usr/bin/gcc && \
    update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-8 30 && \
    update-alternatives --set c++ /usr/bin/g++ && \
    useradd -m user

USER user

ENV PATH=~/.local/bin:${PATH}

COPY docker-entrypoint.sh /
CMD /docker-entrypoint.sh

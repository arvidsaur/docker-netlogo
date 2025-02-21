FROM openjdk:11-bullseye
LABEL maintainer="Reg Arvidson <15174591+arvidsaur@users.noreply.github.com>"

ARG NETLOGO_HOME=/opt/netlogo
ARG NETLOGO_VERSION=6.2.0

ENV LC_ALL=C.UTF-8 \
    LANG=C.UTF-8 \
    NETLOGO_TARBALL=NetLogo-$NETLOGO_VERSION-64.tgz \
    PATH=$PATH:/opt/netlogo/

ENV NETLOGO_URL=https://ccl.northwestern.edu/netlogo/$NETLOGO_VERSION/$NETLOGO_TARBALL

WORKDIR /opt
RUN wget -q $NETLOGO_URL && tar xzf $NETLOGO_TARBALL && ln -sf "NetLogo $NETLOGO_VERSION" netlogo \
    && rm -f $NETLOGO_TARBALL

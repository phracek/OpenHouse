FROM registry.fedoraproject.org/fedora:26

# Environment:
#  * $CACHE_SIZE - Cache size for memcached
# Ports:
#  * 11211

ENV NAME=memcached \
    VERSION=0 \
    RELEASE=1 \
    ARCH=x86_64
LABEL maintainer Petr Hracek <phracek@redhat.com>
LABEL summary="High Performance, Distributed Memory Object Cache" \
    name="$FGC/$NAME" \
    version="0" \
    release="1.$DISTTAG" \
    architecture="$ARCH" \
    com.redhat.component="$NAME" \
    usage="docker run -p 11211:11211 docker.io/modularitycontainers/memcached" \
    help="Runs memcached, which listens on port 11211. No dependencies. See Help File below for more details." \
    description="memcached is a high-performance, distributed memory object caching system, generic in nature, but intended for use in speeding up dynamic web applications by alleviating database load." \
    io.k8s.description="memcached is a high-performance, distributed memory object caching system, generic in nature, but intended for use in speeding up dynamic web applications by alleviating database load." \
    io.k8s.diplay-name="Memcached 1.4 " \
    io.openshift.expose-services="11211:memcached" \
    io.openshift.tags="memcached"

RUN dnf -y install memcached && \
    dnf -y clean all --enablerepo='*'

ADD help.1 /help.1

EXPOSE 11211

# memcached will be run under standard user on Fedora
USER 1000

CMD ["/files/memcached.sh"]

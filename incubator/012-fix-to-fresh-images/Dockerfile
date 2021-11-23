FROM docker.io/freeipa/freeipa-server:fedora-34

COPY init-data /usr/local/sbin/init

VOLUME /data

ENTRYPOINT ["/usr/local/sbin/init"]

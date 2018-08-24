FROM ubuntu

RUN apt-get update \
    && apt-get install -y --no-install-recommends --no-install-suggests g++ clang distcc \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists

COPY entrypoint.sh /entrypoint.sh

EXPOSE 3632

ENTRYPOINT ["/entrypoint.sh"]


FROM ubuntu:14.04

ENV NETWORK "192.168.1.0/24"

RUN apt-get update && \
    apt-get install -y --no-install-recommends --no-install-suggests g++ clang distcc && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists

ADD entrypoint.sh .

EXPOSE 3632

ENTRYPOINT "./entrypoint.sh"

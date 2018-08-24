FROM alpine 

ENV NETWORK "192.168.1.0/24"

RUN apk add --update g++ clang distcc && \
    rm -rf /var/cache/apk/*

ADD entrypoint.sh .

EXPOSE 3632

ENTRYPOINT "./entrypoint.sh"

FROM gentoo/stage3-amd64

ENV NETWORK "192.168.1.0/24"

RUN emerge --sync && emerge distcc clang && \
    rm -rf /usr/portage

ADD entrypoint.sh .

EXPOSE 3632

ENTRYPOINT "/entrypoint.sh"

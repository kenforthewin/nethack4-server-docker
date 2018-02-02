FROM debian:jessie
RUN apt-get update && apt-get install -y -qq build-essential wget gzip tar git make gcc g++ libz-dev flex bison libpq-dev openbsd-inetd libsdl2-dev adduser libpng-dev systemd-sysv telnet
RUN adduser nethack --quiet
WORKDIR /var
RUN git clone http://nethack4.org/media/nethack4.git
WORKDIR /app
RUN chown -R nethack:nethack /app

USER nethack
RUN perl /var/nethack4/aimake -i . --with=server

USER root
RUN echo "53430 stream tcp  nowait nethack /app/nethack4-server nethack4-server" >> /etc/inetd.conf
RUN echo "53430 stream tcp6 nowait nethack /app/nethack4-server nethack4-server" >> /etc/inetd.conf

EXPOSE 23
COPY entrypoint.sh .
ENTRYPOINT [ "./entrypoint.sh" ]
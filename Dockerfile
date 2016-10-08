FROM debian

RUN apt-get update && apt-get install -y python python-protobuf git \
    && mkdir -p /opt \
    && git clone https://github.com/SFTtech/sftmumblebot /opt/mumblebot \
#    && patch /opt/mumblebot/sftbot/ConsoleConnection.py << console-fix.patch \
    && cat /opt/mumblebot/sftbot/ConsoleConnection.py \
    && apt-get purge -y git \
    && apt-get autoremove -y

COPY console-fix.patch sftbot.conf entrypoint.sh /opt/mumblebot/
#COPY sftbot.conf /opt/mumblebot/
#COPY entrypoint.sh /opt/mumblebot/

RUN apt-get install -y patch \
    && patch /opt/mumblebot/sftbot/__main__.py /opt/mumblebot/console-fix.patch \
    && apt-get purge -y patch \
    && apt-get autoremove -y

WORKDIR /opt/mumblebot

ENTRYPOINT ./entrypoint.sh

#CMD ["/opt/mumblebot/run"]

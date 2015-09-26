#FROM bartt/ubuntu-base
FROM phusion/baseimage:0.9.17
MAINTAINER nmcaullay <nmcaullay@gmail.com>

RUN apt-get -y update
RUN apt-get -y install python3-yaml wget

RUN mkdir /pocketmine
RUN cd /pocketmine && curl -sL http://get.pocketmine.net/ | bash -s - -r -v development
#RUN wget http://jenkins.pocketmine.net/job/PocketMine-MP-Bleeding/29/artifact/PocketMine-MP_1.6dev-29_mcpe-0.12_ed559fdf_API-1.13.0.phar
RUN wget http://jenkins.pocketmine.net/job/PocketMine-MP-Bleeding/33/artifact/PocketMine-MP_1.5dev-33_master_cbef0e25_API-1.12.0.phar
RUN mv PocketMine-MP.phar PocketMine-MP-orig.phar
#RUN mv PocketMine-MP_1.5dev-33_master_cbef0e25_API-1.12.0.phar PocketMine-MP.phar

VOLUME /pocketmine
WORKDIR /pocketmine

EXPOSE 19132

CMD ["./start.sh", "--no-wizard", "--enable-rcon=on", "-f PocketMine-MP_1.5dev-33_master_cbef0e25_API-1.12.0.phar"]

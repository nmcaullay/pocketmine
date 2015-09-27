#FROM bartt/ubuntu-base
FROM phusion/baseimage:0.9.17
MAINTAINER nmcaullay <nmcaullay@gmail.com>

RUN apt-get -y update
RUN apt-get -y install python3-yaml wget

RUN mkdir /pocketmine
RUN cd /pocketmine && curl -sL http://get.pocketmine.net/ | bash -s - -r -v development
RUN wget http://jenkins.pocketmine.net/job/PocketMine-MP-Bleeding/30/artifact/PocketMine-MP_1.6dev-30_mcpe-0.12_86c11986_API-1.13.0.phar -O /pocketmine/PocketMine-MP-new.phar

COPY source/eula.txt /pocketmine/eula.txt

VOLUME /pocketmine
WORKDIR /pocketmine

EXPOSE 19132

#CMD ["./start.sh", "--no-wizard", "--enable-rcon=on"]
CMD ["/pocketmine/bin/php5/bin/php", "/pocketmine/PocketMine-MP-new.phar"]

FROM phusion/baseimage:0.9.17
MAINTAINER nmcaullay <nmcaullay@gmail.com>

#RUN apt-get -y install python3-yaml
RUN apt-get -q update
RUN apt-get -y install wget

RUN mkdir /pocketmine
RUN cd /pocketmine && curl -sL http://get.pocketmine.net/ | bash -s - -r -v development
RUN wget http://jenkins.pocketmine.net/job/PocketMine-MP-Bleeding/29/artifact/PocketMine-MP_1.6dev-29_mcpe-0.12_ed559fdf_API-1.13.0.phar
#RUN mv Pocketmine-MP.phar Pocketmine-MP.orig
#RUN mv PocketMine-MP_1.6dev-29_mcpe-0.12_ed559fdf_API-1.13.0.phar Pocketmine-MP.phar

VOLUME /pocketmine
WORKDIR /pocketmine

EXPOSE 19132

CMD ["/pocketmine/start.sh", "--no-wizard", "--enable-rcon=on"]

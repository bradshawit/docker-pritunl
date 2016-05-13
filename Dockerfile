FROM ubuntu:xenial

RUN echo "deb http://repo.pritunl.com/stable/apt xenial main" > /etc/apt/sources.list.d/pritunl.list

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv 7F0CEB10 && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv CF8E292A && \
    apt-get update -q && \
    apt-get upgrade -qy && \
    apt-get install -qy pritunl && \
    apt-get install -qy mongodb-server && \
    apt-get clean
    
EXPOSE 27107
EXPOSE 443
EXPOSE 80

ADD launch.sh /launch.sh
RUN chmod +x "/launch.sh"

CMD ["/launch.sh"]

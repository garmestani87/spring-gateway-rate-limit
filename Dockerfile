FROM openjdk:11
CMD ["mkdir", "/root/config"]
CMD ["mkdir", "/root/logs"]
ENV TZ="Asia/Tehran"
RUN apt-get -y update
RUN apt-get -y install vim
RUN apt-get -y install tcptraceroute
RUN apt-get -y install tcpdump
RUN apt-get -y install telnet
COPY target/classes/*.properties /root/config/
COPY target/classes/*.yml /root/config/
COPY target/api-gateway.jar /root/
WORKDIR /root/
ENTRYPOINT ["java", "-jar", "/root/api-gateway.jar", "--spring.config.location=file:///root/config/"]
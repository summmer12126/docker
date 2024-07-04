FROM maven:3-openjdk-17 AS mbuilder
RUN mkdir /docker
RUN git clone https://github.com/summmer12126/docker/ /docker
WORKDIR /docker

RUN mvn package
FROM tomcat:9-jre17
COPY --from=mbuilder /docker/target/hello-world.war /usr/local/tomcat/webapps/do
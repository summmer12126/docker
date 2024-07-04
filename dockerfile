FROM maven:3-openjdk-11 AS mbuilder
RUN mkdir /hello
RUN git clone https://github.com/summmer12126/docker/
WORKDIR /docker

RUN mvn package
FROM tomcat:9-jre11
COPY --from=mbuilder /docker/target/hello-world.war /usr/local/tomcat/webapps/
ARG GRADLE_VERSION=6.8.3-jdk11
ARG JETTY_VERSION=9.4.44-jdk11
FROM gradle:${GRADLE_VERSION} as gradle
COPY --chown=gradle:gradle . /home/gradle/src
WORKDIR /var/lib/jetty/webapps/


FROM jetty:${JETTY_VERSION} as jetty
COPY --from=gradle /var/lib/jetty/webapps/ /var/lib/jetty/webapps/
EXPOSE 8083

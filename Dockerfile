ARG GRADLE_VERSION=6.8.3-jdk11
ARG JETTY_VERSION=9.4.44-jdk11
FROM gradle:${GRADLE_VERSION} as gradle
COPY --chown=gradle:gradle . /home/gradle/src
WORKDIR /home/gradle/src


FROM jetty:${JETTY_VERSION} as jetty
COPY --from=gradle /home/gradle/src/build/libs/tema-04.-0.0.1-SNAPSHOT.war /var/lib/jetty/webapps/ROOT.war
EXPOSE 8084

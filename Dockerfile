# Use a imagem base do Tomcat
FROM tomcat:9.0-jdk11-openjdk-slim

# Defina variáveis de ambiente para o nome de usuário e senha do Docker Hub
ENV DOCKERHUB_USERNAME=""
ENV DOCKERHUB_PASSWORD=""


# Copie o arquivo war para a pasta webapps do Tomcat
COPY ./target/*.war /usr/local/tomcat/webapps/

# Copie o arquivo de configuração do Tomcat para a pasta conf do Tomcat
COPY ./tomcat-users.xml /usr/local/tomcat/conf/

# Copie o arquivo de configuração do Tomcat para a pasta conf do Tomcat
COPY ./context.xml /usr/local/tomcat/webapps/manager/META-INF/

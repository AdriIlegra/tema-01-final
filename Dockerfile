# Use a imagem base do Tomcat
FROM tomcat:9.0-jdk11-openjdk-slim

# Defina variáveis de ambiente para o nome de usuário e senha do Docker Hub
ENV DOCKERHUB_USERNAME=""
ENV DOCKERHUB_PASSWORD=""


# Copie o arquivo war para a pasta webapps do Tomcat
COPY ./build/libs/*.war /usr/local/tomcat/webapps/
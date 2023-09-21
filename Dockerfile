# Use a imagem base do Tomcat
FROM tomcat:9.0-jdk11-openjdk-slim

# Defina variáveis de ambiente para o nome de usuário e senha do Docker Hub
ENV DOCKERHUB_USERNAME=""
ENV DOCKERHUB_PASSWORD=""

# Copie o arquivo WAR da sua aplicação para o diretório de implantação do Tomcat
COPY ./calculator-app.war /usr/local/tomcat/webapps/

# Use a imagem base do Tomcat
FROM tomcat:9.0-jdk11-openjdk-slim

# Defina variáveis de ambiente para o nome de usuário e senha do Docker Hub
ENV DOCKERHUB_USERNAME=""
ENV DOCKERHUB_PASSWORD=""


# Use a imagem base do Tomcat como ponto de partida
FROM tomcat:latest

# Copie o arquivo WAR da sua aplicação para o diretório de implantação do Tomcat
COPY job-01/build/libs/calculadora.war /usr/local/tomcat/webapps/calculadora.war

# Exponha a porta em que o Tomcat está ouvindo (geralmente a porta 8080)
EXPOSE 8080

# Comando para iniciar o Tomcat quando o contêiner for executado
CMD ["catalina.sh", "run"]

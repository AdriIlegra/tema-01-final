# Use a imagem base do Tomcat
FROM tomcat:9.0-jdk11-openjdk-slim

# Defina variáveis de ambiente para o nome de usuário e senha do Docker Hub
ENV DOCKERHUB_USERNAME=""
ENV DOCKERHUB_PASSWORD=""


# Use a imagem base do Tomcat como ponto de partida
FROM tomcat:latest


# Exponha a porta em que o Tomcat está ouvindo (geralmente a porta 8080)
EXPOSE 8080

# Comando para iniciar o Tomcat quando o contêiner for executado
CMD ["catalina.sh", "run"]

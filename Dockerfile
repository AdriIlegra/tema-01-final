# Use a imagem oficial do Tomcat como base
FROM tomcat:9.0-jdk11-openjdk-slim

# Copie o arquivo WAR da sua aplicação para o diretório webapps do Tomcat
COPY calculadora.war /usr/local/tomcat/webapps/

# Opcional: se você tiver variáveis de ambiente para configurar sua aplicação, defina-as aqui
# ENV VARIAVEL1=valor1
# ENV VARIAVEL2=valor2

# Exponha a porta em que o Tomcat estará ouvindo (geralmente 8080 por padrão)
EXPOSE 8084

# Comando para iniciar o Tomcat
CMD ["catalina.sh", "run"]





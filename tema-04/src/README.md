# Instalação da dependência do Jetty para Java 11 - Calculadora
Este guia fornece instruções passo a passo para a instalação da dependência do Jetty em um projeto Java 11 para criar uma calculadora na porta 8081.

## Pré-requisitos
Java Development Kit (JDK) 11 instalado no seu sistema.
Um projeto Java 11 configurado e pronto para uso.
 ### Passos
1 Abra o arquivo build.gradle do seu projeto.

2 Dentro da seção dependencies, adicione a seguinte linha para incluir a dependência do Jetty:

```java
configurations.all {
exclude group: "org.springframework.boot", module: "spring-boot-starter-tomcat"
exclude group: "org.apache.tomcat.embed", module: "tomcat-embed-el"
}

dependencies {
implementation 'org.springframework.boot:spring-boot-starter-web'
implementation 'org.springframework.boot:spring-boot-starter-jetty'
testImplementation 'org.springframework.boot:spring-boot-starter-test'
testImplementation 'org.junit.jupiter:junit-jupiter:5.8.1'
testImplementation 'org.testng:testng:7.1.0'
}
```
3 Salve o arquivo build.gradle.

4 Agora você está pronto para executar o servidor Jetty e testar a calculadora. Execute a classe CalculatorServer como um aplicativo Java.

5 Abra um navegador da web e acesse http://localhost:8081/calculator para usar a calculadora.

Parabéns! Você instalou com sucesso a dependência do Jetty no Java 11 e criou uma calculadora na porta 8081.

SUM:
http://localhost:8081/calculator/sum?numberX=5&numberY=3

SUBTRACTION:

http://localhost:8081/calculator/subtraction?numberX=5&numberY=3

MULTIPLICATION:

http://localhost:8081/calculator/multiplication?numberX=5&numberY=3

DIVISION:

http://localhost:8081/calculator/divide?numberX=5&numberY=3

POW:

http://localhost:8081/calculator/pow?numberX=5&numberY=3



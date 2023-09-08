pipeline {

    agent any

    environment {
        CI = 'true'
        ARTFACTORY_ACCESS_TOKEN = credentials('artfactory-access-token')
    }

    stages {

        stage('Connect to Git Repository') {
            steps {
                git branch: 'main', url: "https://github.com/AdriIlegra/tema-01-final"
            }
        }

        stage('Gradle clean') {
            steps {
                sh './gradlew clean'
            }
        }

        stage('Gradle test') {
            steps {
                sh './gradlew test'
            }
        }

        stage('Gradle build') {
            steps {
                sh './gradlew build'
            }
        }

        stage('Upload Artifact in JFrog') {
            steps {
                rtUpload (
                    serverId: "Calculadora",
                    spec: """{
                                "files": [
                                    {
                                        "pattern": "build/libs/tema-04.jar",
                                        "target": "Calculadora"
                                    }
                                ]
                    }"""
                )
            }
        }

        stage ('Publish Build Info') {
            steps {
                rtPublishBuildInfo (
                    serverId: 'Calculadora Artifactory'
                )
            }
        }
    }
}
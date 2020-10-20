pipeline {
    agent any
    stages {
        stage ("Compile") {
            steps {
                sh "./mvnw compile"
            }
        }
        stage ("Unit Test") {
            steps {
                sh "./mvnw test"
            }
        }
        stage ("Package") {
                    steps {
                        sh "./mvnw package"
                    }
                }
        stage ("Docker build") {
                    steps {
                         sh "docker build -t calculator ."
                    }
                }
    }
}

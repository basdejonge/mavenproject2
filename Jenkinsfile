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
                         sh "docker build -t calculator2 ."
                    }
                }
         stage ("Docker push") {
                    steps {
                         sh "docker tag calculator2 localhost:5000/calculator2"
                         sh "docker push localhost:5000/calculator2"
                    }
                }
    }
}

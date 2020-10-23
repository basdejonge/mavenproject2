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
         stage ("Docker push") {
                    steps {
                         sh "docker tag calculator localhost:5000/calculator"
                         sh "docker push localhost:5000/calculator"
                    }
                }
        stage ("Deploy to staging") {
                    steps {
                         sh "docker run -d --rm --rm --network="host" -p 8765:8080 --name calculator localhost:5000/calculator"
                    }
                }
        stage ("Acceptance test") {
                    steps {
                         sleep 60
                         sh "chmod +x ./acceptance_test.sh"
                         sh "./acceptance_test.sh"
                    }
                }
    }
}

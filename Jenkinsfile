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
                         sh "docker build --network=host -t calculator ."
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
                         sh "docker run -d -p 8765:50000 --name calculator calculator:latest"
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

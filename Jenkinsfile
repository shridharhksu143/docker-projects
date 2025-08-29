pipeline {
    agent any
    stages {
        stage("connection") {
            steps {
                echo "connected to git"
            }
        }
        stage("build") {
            steps {
                echo "building container"
                sh'docker build -t example-backend .'
            }
        }
        stage("check files copied"){
            steps {
                echo "cheking files copied or not"
            script {
                def result = sh(script:'docker run -d example-backed ls -a', returnStdout: true)
                echo 'files:\n${result}'
                }
            }
        }
        stage("running container") {
            steps {
                echo "running docker in detach mode"
                sh'docker run -d example-backend'
            }
        }
        stage("stop container") {
            steps {
                echo "stoping container"
                sh'docker stop example-backend'
            }
        }
    }
}
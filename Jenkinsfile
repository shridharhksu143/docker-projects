pipeline {
    agent any
    stages {
        stage("connection") {
            step {
                echo "connected to git"
            }
        }
        stage("build") {
            step {
                echo "building container"
                sh'docker build -t example-backend .'
            }
        }
        stage("check files copied"){
            step {
                echo "cheking files copied or not"
            script {
                def result = sh(script:'docker run -d example-backed ls -a', returnStdout: true)
                echo 'files:\n${result}'
                }
            }
        }
        stage("running container") {
            step {
                echo "running docker in detach mode"
                sh'docker run -d example-backend'
            }
        }
        stage("stop container") {
            step {
                echo "stoping container"
                sh'docker stop example-backend'
            }
        }
    }
}
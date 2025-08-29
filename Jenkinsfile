pipeline {
    agent any
    stages {
        stage("connection") {
            echo "connected to git"
        }
        stage("build") {
            echo "building container"
            sh'docker build -t example-backend .'
        }
        stage("check files copied"){
            echo "cheking files copied or not"
            script {
                def result = sh(script:'docker run -d example-backed ls -a', returnStdout: true)
                echo 'files:\n${result}'
            }
        }
        stage("running container") {
            echo "running docker in detach mode"
            sh'docker run -d example-backend'
        }
        stage("stop container") {
            echo "stoping container"
            sh'docker stop example-backend'
        }
    }
}
pipeline {
    agent any
    stages {
        step("connection") {
            echo "connected to git"
        }
        step("build") {
            echo "building container"
            sh'docker build -t example-backend .'
        }
        step("check files copied"){
            echo "cheking files copied or not"
            script {
                def result = sh(script:'docker run -d example-backed ls -a', returnStdout: true)
                echo 'files:\n${result}'
            }
        }
        step("running container") {
            echo "running docker in detach mode"
            sh'docker run -d example-backend'
        }
        step("stop container") {
            echo "stoping container"
            sh'docker stop example-backend'
        }
    }
}
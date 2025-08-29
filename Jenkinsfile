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
        stage("running container removing") {
            steps {
                sh '''
                # Remove container if already exist"
                docker rm -f example-backend || true

                # Start fresh container 
                docker run -d --name example-backend -p 8000:8080 example-backend
                '''
            }
        }
        stage("check files copied"){
            steps {
                echo "cheking files copied or not"
            script {
                def result = sh(script:'docker exec example-backend ls -a /app', returnStdout: true).trim()
                echo "files:\n${result}"
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
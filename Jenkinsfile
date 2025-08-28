pipeline {
    agent any
    stages {
        stage("build") {
            steps {
            echo "building docker container"
            sh'docker build -t sample_docker .'
            }
        }
        stage("running") {
            steps {
                echo "running docker for checking file"
                script {
                    def result = sh(script:'docker run -d sample_docker ls -a', returnStdout: true)
                    echo 'files:\n${result}'
                }
            }
        }
        stage("test") {
            steps {
            echo "file available and runnig script"
            sh'docker run -d sample_docker'
            }
        }
    }
}

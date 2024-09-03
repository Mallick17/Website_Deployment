pipeline {
    agent any
    tools {
        maven 'maven'
    }
    stages {
        // stage('pull') {
        //     steps {
        //         git credentialsId: 'mallick', url: 'https://github.com/Mallick17/Website_Deployment.git'
        //     }
        // }
        stage('build') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('docker image') {
            steps {
                script {
                    sh 'docker build -t mallick .'
                    sh 'docker tag mallick mallick17/final_mock'
                }
            }
        }
        stage('Docker Login') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'GyanDmallick', passwordVariable: 'DOCKERHUB_PASSWORD', usernameVariable: 'DOCKERHUB_USERNAME')]) {
                        sh "echo ${DOCKERHUB_PASSWORD} | docker login -u ${DOCKERHUB_USERNAME} --password-stdin"
                    }
                }
            }
        }
        stage('Docker push') {
            steps {
                script {
                    sh 'docker push mallick17/final_mock'
                }
            }
        }
        stage('Run Docker Container') {
            steps {
                script {
                    sh 'docker pull mallick17/final_mock'
                    sh 'docker rm -f mallick || true'
                    sh 'docker run -d --name mallick -p 8090:8080 mallick17/final_mock'
                }
            }
        }
    }
}

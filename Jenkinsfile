pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', changelog: false, credentialsId: '7aeef0dc-efd2-43ba-a0cb-4c157cabd183', poll: false, url: 'https://github.com/rosaiser-36/DevSecOps-Project.git' 
            }
        }
         stage('build docker image') {
            steps {
                sh 'docker build -t nodejs_app .'
            }
        }
        stage ('push docker image to docker hub'){
            steps{
               withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'dockerHubuser', passwordVariable: 'dockerhubPass')]) {
                echo '$env.dockerHubuser'
                sh "docker tag nodejs_app ${env.dockerHubuser}/devsecops_project:latest"
                sh "docker login -u ${env.dockerHubuser} -p ${env.dockerHubpass}"
                sh "docker push ${env.dockerHubuser}/devsecops_project:latest"
                }
            }
        }
	}
}
       

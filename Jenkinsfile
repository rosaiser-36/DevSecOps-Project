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
                sh 'docker build -t nodejs-docker-image .'
            }
        }
	}
}
       

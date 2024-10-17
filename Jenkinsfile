pipeline {
    agent any
    
     environment {
        IMAGE_TAG = "${BUILD_NUMBER}"
        DOCKERHUB_CREDENTIALS= credentials('dockercred')
    }

    stages {
        stage('checkout') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/its-varthini/Python_App.git']])
            }
        }
        
        stage('docker build') {
            steps {
                echo 'build docker image'
                sh 'docker build -t varthinidochub/python-quotes:${BUILD_NUMBER} .'
            }
        }
    }
}

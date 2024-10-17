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
        
        stage('Login to Docker Hub') {      	
            steps{                       	
            	sh '''
            	docker login --username=$DOCKERHUB_CREDENTIALS_USR --password=$DOCKERHUB_CREDENTIALS_PSW              		
            	echo 'Login Completed' 
            	'''
            }           
        }
        
        stage('Push the artifacts'){
           steps{
                
                    sh '''
                    echo 'Push to dockerhub'
                    docker push varthinidochub/python-quotes:${BUILD_NUMBER}
                    
                    '''
                
            }
        }
    }
}

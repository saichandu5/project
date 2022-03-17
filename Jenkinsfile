pipeline {
    agent any

    stages {
        
        stage('Validate') {
            steps {
                sh 'mvn validate'
            }
        }
        stage('Build') {
            steps {
                sh 'mvn package'
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }
        stage('Docker Build and Tag') {
            steps {
                sh 'docker build -t sample-app:latest .'
                sh 'docker tag sample-app saichandu5/sample-app:latest
                //sh 'docker tag sample-app saichandu5/sample-app:$1.0'
            }
        }   
        
    }
}   

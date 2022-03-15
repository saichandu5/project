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
        stage('Building Docker image') {
            steps {
                 sh 'docker build -t saichandu5/sp.app:latest .'
            }
        }

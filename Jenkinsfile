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
        stage('Deploy') {
            steps {
                sh 'mvn clean'
            }
        }
        stage('Dockerfile is true')
            steps {
                sh 'docker build -t saichandu5/my-project .'
            }
        }

    } 
}

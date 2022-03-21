    pipeline {
        agent any
        
        stages {
            
            stage('Validate') {
                steps {
                    sh 'mvn validate'
                }
            }
            stage('Test') {
                steps {
                    sh 'mvn test'
                }
            }
            stage('Build') {
                steps {
                    sh 'mvn package'
                }
            }
            stage('Docker Build and Tag') {
                steps {
                    sh 'docker build -t sample-app:latest .'
                    sh 'docker tag sample-app saichandu5/sample-app:latest'
                    //sh 'docker tag sample-app saichandu5/sample-app:$1.0'
                }
            }   
            stage('Docker push') {
                steps {
                    withCredentials([string(credentialsId: 'Docker-pwd', variable: 'Docker-pwd')]) {
                    sh 'docker login -u saichandu5 -p ${Docker-pwd}'
                }
                
            }
            }
            stage('push to docker hub') {  
                steps{
                    sh 'docker push saichandu5/sample-app:latest'

                }
            }
            
            stage('Run Docker container on Jenkins agent') {
                steps {
                    sh 'docker run -d -p 8005:8080 saichandu5/sample-app'
                }          
            }
            stage('CleanUP')
            {
                steps {
                    cleanWs()
                }
            
            } 
                
        }      
    }        

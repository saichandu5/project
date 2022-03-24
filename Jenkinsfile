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
                    sh 'docker login -u saichandu5 -p Chandu@578'
                }
            }   
            stage('push to docker hub') {  
                steps{
                    sh 'docker push saichandu5/sample-app:latest'
                }
            } 
            
            stage('Deploy to K8s') {
                steps {
                     kubernetesDeploy configs: 'deployment.yaml', kubeconfigId: 'K8S-CONFIG'
                     kubenetesDeploy configs: 'service-loadbalancer.yaml', kubeconfigId: 'K8S-CONFIG'
                } 
            }
            stage('CleanUP') {
                steps {
                    cleanWs()
                }
            }
        }   
    }      

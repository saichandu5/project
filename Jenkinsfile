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
            stage('CleanUP') {
                steps {
                    cleanWs()
                }
            }
            stage('Deploy to K8s') {
                steps {
                     kubernetesDeploy configs: 'deploymentservice.yml', kubeConfig: [path: '/home/centos/.kube'], kubeconfigId: 'KUBERNETES_CONFIG', serverUrl: 'https:////api-chandu-k8s-local-hvr9ga-1987951367.ap-south-1.elb.amazonaws.com'
                     sh 'kubectl apply -f deploymentservice.yml'
                } 
            }
        
        }   
    }      

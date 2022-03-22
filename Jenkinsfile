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
            stage('Deploy to K8S cluster') {
                steps {
                    kubernetesDeploy configs: 'Deploymentservice.yml', kubeConfig: [path: ''], kubeconfigId: 'K8S-CLUSTER-CONFIG', secretName: '', ssh: [sshCredentialsId: '*', sshServer: ''], textCredentials: [certificateAuthorityData: '', clientCertificateData: '', clientKeyData: '', serverUrl: 'https://13.233.193.110']
                } 
            }
        
        }   
    }      

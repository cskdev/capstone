pipeline {
    agent any
tools {
  maven 'Maven'
  nodejs 'nodejs'
}
    stages {
        stage('Checkout') {
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[credentialsId: 'cb1ea957-f126-4fdc-8a6c-88cdf4612072', url: 'http://localhost:3000/demouser/capstoneproject.git']]])
                
            }
        }
        
    stage('Build'){
            steps{
                 sh ('mvn clean install')
            }
        }
       stage('SonarQube analysis') {
      steps {
        script {
          // requires SonarQube Scanner 2.8+
          scannerHome = tool 'SonarQube-Scanner'
        }
        withSonarQubeEnv('sonarqube') {
          sh "${scannerHome}/bin/sonar-scanner -Dsonar.projectKey=capstone_projects"
        }
      }
    }
   
      stage ('Artifactory Configuration') {
            steps {
                rtServer (
                    id: "Jfrog",
                    url: 'http://192.168.56.102:8081/artifactory',
                    username: 'admin',
                    password: 'Saicheruku1@',
                    bypassProxy: true,
                    timeout: 300)
                

                rtUpload (
                    serverId: "Jfrog",
                    spec: """{
                    "files":[
                    {
                    "pattern": "*.war",
                    "target": "jfrogcapstone-libs-snapshot"
                    }
                    ]
                    }""",)
                  
                 
                rtPublishBuildInfo (
                    serverId: "Jfrog")
            }
        }

          stage('Docker build Images'){
             steps{
                 script{
                  sh    'cp target/capstone.war ansible_capstone/'
                  sh    'docker stack rm mystack'
                  sh   'docker image rmi -f capstone'
                  sh  'python3 -m pip install --upgrade pip'
                  sh  'python3 -m pip install jsondiff'
                  sh  'docker image build -f ./ansible_capstone/Dockerfile -t capstone ./ansible_capstone'
                  sh  'docker image build -f ./ansible_capstone/Dockerfile-mysql -t mysql-standalone ./ansible_capstone'
                  sh  'ansible-playbook ./ansible_capstone/playbook.yaml -vvv'
                 }
             }
         }
        
       
    }
    
}


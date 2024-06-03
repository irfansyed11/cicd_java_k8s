pipeline {
 //  agent any
  agent { label 'docker' }
//	tools {
//		jdk 'jdk8'
//	}
//	environment {
//		M2_INSTALL = "/usr/bin/mvn"
//	}

    stages {
        // stage('Clone-Repo') {
	//   	steps {
	//        	docker run -it maven mvn clean install
	//    	}
        // }

        stage('Build') {
	    steps {
	       sh "whoami"
               sh "chmod +x myscript.sh"
               sh "./myscript.sh"
            }
         }
	stage('Build and Push Docker Image') {
           environment {
           DOCKER_IMAGE = "irfansyed11/javaapp:${BUILD_NUMBER}"
           // DOCKERFILE_LOCATION = "java-maven-sonar-argocd-helm-k8s/spring-boot-app/Dockerfile"
           REGISTRY_CREDENTIALS = credentials('docker-cred')
           }
           steps {
             script {
               sh 'docker build -t ${DOCKER_IMAGE} .'
	       // this code block requires 'Docker Pipeline Plugin' installed
                def dockerImage = docker.image("${DOCKER_IMAGE}")
                docker.withRegistry('https://registry.hub.docker.com/v2', "docker-cred") {
                dockerImage.push()
                 }
             }
           }
          }

        stage('Deployment') {
            steps {
                sh 'echo "came to deployment"'
            }
        }
    }
}

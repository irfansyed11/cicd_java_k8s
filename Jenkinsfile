pipeline {
    agent {
        label "docker"
    }

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
               sh "chmod +x myscript.sh"
               sh "./myscript.sh"
            }
        }
		
        stage('build docker image and push') {
            steps {
                sh 'docker build -t irfansyed11/javaapp .'
                sh 'docker tag irfansyed11/javaapp irfansyed11/javaapp'
                sh 'docker login '
            }
        }

        stage('Deployment') {
            steps {
                sh 'sshpass -p "wiculty" scp target/gamutkart.war wiculty@172.17.0.2:/home/wiculty/Distros/apache-tomcat-9.0.88/webapps'
                sh 'sshpass -p "wiculty" ssh wiculty@172.17.0.2 "/home/wiculty/Distros/apache-tomcat-9.0.88/bin/startup.sh"'
            }
        }
    }
}

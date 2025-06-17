pipeline {
	agent any
	
	
	
	environment {
		SONAR_TOKEN = credentials('todolist-app')
	}

	stages {
		stage('Checkout') {
			steps {
				git branch: 'main', url: 'https://github.com/cygday/to-do-list-app.git'
			}
		   } 
		stage('Install Dependencies') {
               		steps {
                   		sh 'npm install'
               	    }
           	}
		stage('SonarQube Analysis') {
               		steps {
                   		withSonarQubeEnv('jenkins-sonarqube-todolist') { 
                       			sh 'sonar-scanner'
		   		}
               		}
           	}

	        
        	stage('Run Tests') {
               		steps {
                   		sh 'npm run test'
               		}	
           	}
       	}

        post {
           success {
		   sh 'echo "build successs"'
           }
           failure {
		   sh 'echo "build failed"'
           }
       }
}

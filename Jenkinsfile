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
               // You can add any actions here after successful build
               // Example:  Send a notification
		   sh 'post_success'
           }
           failure {
               // Actions to take on failure
		   sh 'post_failure'
           }
       }
}

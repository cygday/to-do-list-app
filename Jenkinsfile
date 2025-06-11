

pipeline {
	agent any 

	environment {
		SONARQUBE_ENV = 'jenkins-sonarqube-todolist'
	}

	stages {
		stage('Checkout') {
			steps {
				git 'https://github.com/cygday/to-do-list-app.git'
			}
		}
		stage('SonarQube Analysis') {
			steps {
				withSonarQubeEnv("${SONARQUBE_ENV}") {
					sh 'sonar-scanner'
				}
			}
		}
	}

}



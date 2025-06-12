

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
		   stage('Install Dependencies') {
               steps {
                   sh 'npm install'
               }
           }

        stage('SonarQube Analysis') {
               steps {
                   withSonarQubeEnv('jenkins-sonarqube-todolist') { // 'sonarqube_instance' is the name you gave in Jenkins
                       sh 'sonar-scanner -Dsonar.projectKey=todo-list-app,
			   -Dsonar.projectName='to-do-list app,
			   -Dsonar.host.url='http://localhost:9000,
			   -Dsonar.login='squ_d3ad48f1383c65855bb6e47244e445989bc0ce1c,
			   -Dsonar.sources=to-do-list-app, -Dsonar.tests=test'
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
  }
}

}



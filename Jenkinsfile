pipeline{
	agent none
	tools {
		maven 'M3'
	}
	stages {
		stage ('Checkout') {
			steps {
				git 'https://github.com/ashokshingade24/spring-webapp-template.git'
			}
		}
		stage ('Build') {
			agent { label 'avengers' }
			steps {
				sh 'mvn clean package'
				junit '**/target/surefire-reports/TEST-*.xml'
			}
		}
	}
}

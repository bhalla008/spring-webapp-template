pipeline{
	agent any
	stages {
		stage ('Checkout') {
			steps {
				git 'https://github.com/ashokshingade24/spring-webapp-template.git'
			}
		}
		stage ('Build') {
			agent { docker 'maven:3.5-alpine' }
			steps {
				sh 'mvn clean package'
				junit '**/target/surefire-reports/TEST-*.xml'
			}
		}
		stage('Deploy') {
			steps {
				input 'Do you want to aprove the deployment?'
				sh "java -jar target/*.jar"
			}
		}
	}
}

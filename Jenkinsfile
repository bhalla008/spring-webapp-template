pipeline{
	agent { docker 'maven:3.5-alpine' }
	stages {
		stage ('Checkout') {
			steps {
				git 'https://github.com/ashokshingade24/spring-webapp-template.git'
			}
		}
		stage ('Build') {
			steps {
				sh 'mvn clean package'
				junit '**/target/surefire-reports/TEST-*.xml'
				archiveArtifacts artifact: 'target/*.jar', fingerprint: true
			}
		}
	}
}

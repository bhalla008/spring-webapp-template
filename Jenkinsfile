pipeline{
	agent { label 'ec2-fleet' }
	tools {
		maven 'M3'
		jdk 'jdk'
	}
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
			}
		}
	}
}

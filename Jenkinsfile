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
				sh 'scp -i /home/ec2-user/jenkins-pipeline.pem target/*.jar jenkins@ec2-35-165-245-44.us-west-2.compute.amazonaws.com:/opt/web'
				sh "ssh -i /home/ec2-user/jenkins-pipeline.pem jenkins@ec2-35-165-245-44.us-west-2.compute.amazonaws.com 'nohup java -jar /opt/web/*.jar &'"
			}
		}
	}
}

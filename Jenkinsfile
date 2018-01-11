pipeline{
	agent { docker 'maven:3.5-alpine' }
	stages {
		stage ('Checkout') {
			steps {
				git 'https://github.com/ashokshingade24/spring-petclinic.git'
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
				sh 'scp target/*.jar jenkins@ec2-35-165-245-44.us-west-2.compute.amazonaws.com:/opt/web'
				sh "ssh jenkins@ec2-35-165-245-44.us-west-2.compute.amazonaws.com 'nohup java -jar /opt/web/*.jar &'"
			}
		}
	}
}

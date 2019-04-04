pipeline{
	agent { label 'ec2-fleet-linux' }
	tools {
		maven 'M3'
		jdk 'JDK8'
	}
	stages {
		stage ('Clone the Repo') {
			steps {
				git 'https://ashokshingade24@bitbucket.org/ashokshingade24/webapp_maven_deploy.git'
			}
		}
		stage ('Compile') {
			steps {
				sh 'mvn compile'
			}
		}
		stage ('Unit Test') {
			steps {
				sh 'mvn clean test'
			}
		}
		stage ('Build Artifact') {
			steps {
				sh 'mvn clean package'
			}
		}
		stage ('SonarQube Analysis') {
			steps {
				withSonarQubeEnv('sonar') {
					script {
						sh 'mvn sonar:sonar -Dsonar.projectKey=sample-maven -Dsonar.organization=ashokshingade24-bitbucket -Dsonar.host.url=https://sonarcloud.io -Dsonar.login=c6b5dceeb8c718fbc55edfdf88e78e95844f2760'
					}
				}
			}
		}
	}
}

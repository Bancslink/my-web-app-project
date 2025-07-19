//Pipeline with Parameters

pipeline {
    agent any

    tools {
        maven "maven-3.9.9"
    }

    // ✅ Build Parameters
    parameters {
        string(name: 'BRANCH_NAME', defaultValue: 'development', description: 'Git branch to build')
        choice(name: 'ENVIRONMENT', choices: ['dev', 'qa', 'prod'], description: 'Deployment environment')
        booleanParam(name: 'DEPLOY_TO_TOMCAT', defaultValue: true, description: 'Deploy WAR to Tomcat?')
    }

    

    stages {
        stage('Git Checkout') {
            steps {
                echo "Checking out branch: ${params.BRANCH_NAME}"
                git branch: "${params.BRANCH_NAME}", url: 'https://github.com/Bancslink/my-web-app-project.git'
            }
        }

        stage('Build') {
            steps {
                sh "mvn clean package"
            }
        }

        stage('SonarQube Report') {
            steps {
                sh "mvn sonar:sonar"
            }
        }

        stage('Deploy to Nexus') {
            steps {
                sh "mvn deploy"
            }
        }

        stage('Deploy to Tomcat') {
            when {
                expression { return params.DEPLOY_TO_TOMCAT }
            }
            steps {
                echo "Deploying WAR file to Tomcat in environment: ${params.ENVIRONMENT}"
                sh """
                    curl -u sandeep:1234 \
                        --upload-file /var/lib/jenkins/workspace/Declarative-pipeline-jio/target/maven-web-application.war \
                        "http://13.232.56.56:8000/manager/text/deploy?path=/maven-web-application&update=true"
                """
            }
        }
    }
}

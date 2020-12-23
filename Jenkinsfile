pipeline{
    agent any
    stages {
        stage('Build Artifact') {
            steps{
                sh label:'maven building', script: 'mvn clean package -DskipTests'
            }
        }
        stage('Build Image'){
            steps{
                sh label:'image building', script: '/bin/bash artifact2image.sh'
            }
        }
        stage('Deploy k8s'){
            steps{
                sh label:'deploy image to k8s', script: '/bin/bash deploy2k8s.sh'
            }
        }
    }
}

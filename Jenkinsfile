pipeline{
    agent any
    options {
        timestamps()  //显示运行时的时间
        disableConcurrentBuilds()  //禁用Jenkins同时执行多次该pipeline
        buildDiscarder logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '', daysToKeepStr: '5', numToKeepStr: '10') //丢弃旧的构建策略
    }
    environment {
        KUBE_MASTER="192.168.87.129"
        USER="hellxz"
        UPLOAD_DIR="/home/hellxz/cicd-demo"
        BUILD_RELATIVE_DIR="cicd-demo"
    }
    stages {
        stage('Pull Source') {
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], 
                          doGenerateSubmoduleConfigurations: false, extensions: [[$class: 'CleanCheckout']], submoduleCfg: [], 
                          userRemoteConfigs: [[url: 'https://github.com/hellxz/cicd-demo.git']]])
            }
        }
        stage('Build Artifact') {
            steps{
                dir("${BUILD_RELATIVE_DIR}"){
                    sh label:'maven building', script: 'mvn clean package -DskipTests'
                }
            }
        }
        stage('Build Image'){
            steps{
                dir("${BUILD_RELATIVE_DIR}"){
                    sh label:'image building', script: '/bin/bash artifact2image.sh'
                }
            }
        }
        stage('Deploy k8s'){
            steps{
                sh label:'deploy image to k8s', script: '/bin/bash deploy2k8s.sh'
            }
        }
    }
}

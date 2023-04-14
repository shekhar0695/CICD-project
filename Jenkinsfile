pipeline {

  environment {
    dockerImage: node:14
  }
  agent any

  stages {

    stage('Checkout Source') {
      steps {
        checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/shekhar0695/CICD-project']])
      }
    }

    stage('Build image') {
      steps{
        script {
          dockerImage = docker build -t dockerImage
        }
      }
    }

    stage('Pushing Image') {
      steps{
        script {
          withCredentials([string(credentialsId: 'dockerhub', variable: 'dockerhub-pwd')]) {
                   sh 'docker login -u shekharrr -p ${dockerhub-pwd}'
          }
        }
      }
    }

    stage('Deploying App to Kubernetes') {
      steps {
        script {
          kubernetesDeploy(configs: "deploymentservice.yml", kubeconfigId: "kubernetes")
        }
      }
    }

  }
}
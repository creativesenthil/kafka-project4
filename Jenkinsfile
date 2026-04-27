pipeline {
    agent any

    environment {
        TF_IN_AUTOMATION = "true"
    }

    stages {

        stage('Checkout') {
            steps {
                echo "Cloning repository..."
                git branch: 'main', url: 'https://github.com/creativesenthil/kafka-project4.git'
            }
        }

        stage('Verify Workspace') {
            steps {
                sh '''
                echo "Current path:"
                pwd
                echo "Files:"
                ls -l
                '''
            }
        }

        stage('Check Docker & Kafka') {
            steps {
                sh '''
                echo "Checking Docker containers..."
                docker ps

                echo "Checking Kafka broker..."
                docker ps | grep broker || (echo "Kafka broker not running" && exit 1)
                '''
            }
        }

        stage('Wait for Kafka Ready') {
            steps {
                sh '''
                echo "Waiting for Kafka to stabilize..."
                sleep 20
                '''
            }
        }

        stage('Terraform Init') {
            steps {
                sh '''
                cd terraform/local
                terraform init
                '''
            }
        }

        stage('Terraform Plan') {
            steps {
                sh '''
                cd terraform/local
                terraform plan
                '''
            }
        }

        stage('Terraform Apply') {
            steps {
                sh '''
                cd terraform/local
                terraform apply -auto-approve
                '''
            }
        }
    }

    post {
        success {
            echo "✅ Pipeline SUCCESS"
        }
        failure {
            echo "❌ Pipeline FAILED"
        }
    }
}

pipeline {
    agent any

    tools {
        git 'Default'   // optional (works even if not configured)
    }

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
                echo "Listing files:"
                ls -l
                '''
            }
        }

        stage('Terraform Init') {
            steps {
                sh '''
                echo "Initializing Terraform..."
                cd terraform/local
                terraform init
                '''
            }
        }

        stage('Terraform Plan') {
            steps {
                sh '''
                echo "Running Terraform Plan..."
                cd terraform/local
                terraform plan
                '''
            }
        }

        stage('Terraform Apply') {
            steps {
                sh '''
                echo "Applying Terraform..."
                cd terraform/local
                terraform apply -auto-approve
                '''
            }
        }
    }

    post {
        success {
            echo "✅ Pipeline executed successfully!"
        }
        failure {
            echo "❌ Pipeline failed. Check logs."
        }
    }
}

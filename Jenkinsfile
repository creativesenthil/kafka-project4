pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/creativesenthil/kafka-project4.git'
            }
        }

        stage('Terraform') {
            steps {
                sh '''
                echo "Starting Terraform..."

                cd kafka-project4/terraform/local

                terraform init
                terraform apply -auto-approve
                '''
            }
        }
    }
}

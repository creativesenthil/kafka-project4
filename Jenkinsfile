pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/creativesenthil/kafka-project4.git'
            }
        }

        stage('Terraform') {
            steps {
                sh '''
                cd kafka-project4/terraform/local
                terraform init
                terraform apply -auto-approve
                '''
            }
        }
    }
}

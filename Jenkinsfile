pipeline {

    agent any

    parameters {
        booleanParam(
            name: 'autoApprove',
            defaultValue: false,
            description: 'Automatically run apply after generating plan?'
        )
    }

    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }

    stages {

        stage('Checkout') {
            steps {
                dir('terraform') {
                    git url: 'https://github.com/Srinivas-git-cmd/terraform-jenkins.git'
                }
            }
        }

        stage('Plan') {
            steps {
                sh '''
                    cd terraform
                    terraform init
                    terraform plan -out=tfplan
                    terraform show -no-color tfplan > tfplan.txt
                '''
            }
        }

        stage('Approval') {
            when {
                not {
                    expression { params.autoApprove }
                }
            }
            steps {
                script {
                    def plan = readFile 'terraform/tfplan.txt'
                    input(
                        message: 'Do you want to apply the plan?',
                        parameters: [
                            text(
                                name: 'Plan',
                                description: 'Please review the plan',
                                defaultValue: plan
                            )
                        ]
                    )
                }
            }
        }

        stage('Apply') {
            steps {
                sh '''
                    cd terraform
                    terraform apply -input=false tfplan
                '''
            }
        }
    }
}

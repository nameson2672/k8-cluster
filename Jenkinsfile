pipeline {
    agent any

    environment {
        GIT_REPO = 'https://github.com/nameson2672/k8-cluster.git'
        BRANCH = 'main'
        CREDENTIALS_ID = '960775' // This should be the ID of your secret text credential
    }

    stages {
        stage('Clone Repository') {
            steps {
                withCredentials([string(credentialsId: env.CREDENTIALS_ID, variable: 'GITHUB_TOKEN')]) {
                    script {
                        // Use the token for HTTPS authentication
                        sh "git clone https://$GITHUB_TOKEN@github.com/nameson2672/k8-cluster.git"
                    }
                }
            }
        }

        stage('Make Changes') {
            steps {
                script {
                    // Example: Create a new file and add content
                    sh 'git config --global user.email "jankins@example.com"'
                    sh 'git config --global user.name "Jankines Agent"'
                    sh 'echo "Hello, World!" > newfile.txt'
                    sh 'git add newfile.txt'
                    sh 'git commit -m "Add new file"'
                }
            }
        }

        stage('Push Changes') {
            steps {
                withCredentials([string(credentialsId: env.CREDENTIALS_ID, variable: 'GITHUB_TOKEN')]) {
                    script {
                        // Use the token for HTTPS authentication
                        sh "git push https://$GITHUB_TOKEN@github.com/nameson2672/k8-cluster.git HEAD:${BRANCH}"
                    }
                }
            }
        }
    }
}

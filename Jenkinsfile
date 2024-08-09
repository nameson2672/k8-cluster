pipeline {
    agent any

    environment {
        GIT_REPO = 'https://github.com/nameson2672/k8-cluster.git'
        BRANCH = 'main'
        CREDENTIALS_ID = '960775'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: env.BRANCH, url: env.GIT_REPO, credentialsId: env.CREDENTIALS_ID
            }
        }

        stage('Make Changes') {
            steps {
                script {
                    // Example: Create a new file and add content
                    sh 'echo "Hello, World!" > newfile.txt'
                    sh 'git add newfile.txt'
                    sh 'git commit -m "Add new file "'
                }
            }
        }

        stage('Push Changes') {
            steps {
                script {
                    withCredentials([sshUserPrivateKey(credentialsId: env.CREDENTIALS_ID, keyFileVariable: 'SSH_KEY')]) {
                        sh 'git push origin HEAD:${BRANCH}'
                    }
                }
            }
        }
    }
}

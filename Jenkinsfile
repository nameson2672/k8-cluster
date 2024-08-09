pipeline {
    agent any

    environment {
        GIT_REPO = 'https://github.com/nameson2672/k8-cluster.git'
        BRANCH = 'main'// This should be the ID of your secret text credential
    }

    stages {
        stage('Clone Repository') {
            steps {
                withCredentials([string(credentialsId: env.CREDENTIALS_ID, variable: 'GITHUB_TOKEN')]) {
                    script {
                        // Use the token for HTTPS authentication
                        sh "git clone https://github.com/nameson2672/k8-cluster.git"
                    }
                }
            }
        }

        stage('Make Changes') {
            steps {
                script {
                 withCredentials([usernamePassword(credentialsId: 'github', passwordVariable: 'GIT_PASSWORD', usernameVariable: 'GIT_USERNAME')]) {

                    // Example: Create a new file and add content
                    sh "git config --global user.email ${GIT_USERNAME}"
                    sh 'git config --global user.name Jankines Agent'
                    sh 'echo "Hello, World!" > newfile.txt'
                    sh 'git add newfile.txt'
                    sh 'git commit -m "Add new file"'
                }
                }
            }
        }

        stage('Push Changes') {
            steps {
                 withCredentials([usernamePassword(credentialsId: 'github', passwordVariable: 'GIT_PASSWORD', usernameVariable: 'GIT_USERNAME')]) {
                        //def encodedPassword = URLEncoder.encode("$GIT_PASSWORD",'UTF-8')
                        sh "git config user.email ${GIT_USERNAME}"
                        sh "git config user.name Jankines Agent"
                        sh "git push https://${GIT_USERNAME}:${GIT_PASSWORD}@github.com/${GIT_USERNAME}/kubernetesmanifest.git HEAD:main"
      }
            }
        }
    }
}

node {
    def app

    stage('Clone repository') {
        checkout scm
    }

    stage('Update GIT') {
        script {
            catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                withCredentials([usernamePassword(credentialsId: 'github', passwordVariable: 'GIT_PASSWORD', usernameVariable: 'GIT_USERNAME')]) {
                    sh 'git config user.email "jenkins@example.com"'
                    sh 'git config user.name "Jenkins Agent"'
                    sh 'echo "Hello, World!" > newfile.txt'
                    sh 'git add newfile.txt'
                    sh 'git commit -m "Done by Jenkins Job changemanifest: ${env.BUILD_NUMBER}"'
                    
                    // Use a separate shell block to securely pass credentials
                    sh """
                        git push https://${GIT_USERNAME}:${GIT_PASSWORD}@github.com/nameson2672/k8-cluster.git HEAD:main
                    """
                }
            }
        }
    }
}

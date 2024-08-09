node {
    def app

    stage('Clone repository') {
        checkout scm
    }

    stage('Update GIT') {
        script {
            catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                withCredentials([usernamePassword(credentialsId: 'github', passwordVariable: 'GIT_TOKEN', usernameVariable: 'GIT_USERNAME')]) {
                    sh 'git config user.email "namesongaudel.ng@gmail.com"'
                    sh 'git config user.name nameson2672'
                    sh 'echo "Hello, World!" > newfile.txt'
                    sh 'git add newfile.txt'
                    sh 'git commit -m "Done by Jenkins Job changemanifest: ${env.BUILD_NUMBER}"'
                    
                    //sh "git push https://${GIT_USERNAME}:${GIT_PASSWORD}@github.com/${GIT_USERNAME}/k8-cluster.git HEAD:main"

                    // Use personal access token for authentication
                    sh '''
                        export GIT_ASKPASS=$(mktemp)
                        echo "echo \\"$GIT_TOKEN\\"" > $GIT_ASKPASS
                        chmod +x $GIT_ASKPASS
                        git push https://github.com/nameson2672/k8-cluster.git HEAD:main
                        rm $GIT_ASKPASS
                    '''
                }
            }
        }
    }
}

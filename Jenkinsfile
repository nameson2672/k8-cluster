pipeline {
    agent any

    environment {
        // Initialize variables
        GIT_USERNAME = 'SahadevDahit'  // Update with your GitHub username
        GIT_TOKEN_CREDENTIALS_ID = 'access-token'  // Update with the ID of your GitHub PAT credential
    }

    parameters {
        string(name: 'DOCKERTAG', defaultValue: '', description: 'Docker tag for the image')
    }

    stages {

    stage('Clone repository') {
        checkout scm
    }

    stage('Update GIT') {
        script {
            catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                withCredentials([usernamePassword(credentialsId: 'github', passwordVariable: 'GIT_TOKEN', usernameVariable: 'GIT_USERNAME')]) {
                    sh 'git config user.email "namesongaudel.ng@gmail.com"'
                    sh 'git config user.name Jenkins'
                    sh "echo ${params.DOCKERTAG} >> newfile.txt"
                    sh 'git add .'
                    sh 'git commit -m "Done by Jenkins Job changemanifest"'
                    
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
}
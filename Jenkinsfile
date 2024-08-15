pipeline {
    agent any

    parameters {
        string(name: 'DOCKERTAG', defaultValue: '', description: 'Docker tag for the image')
        choice(name: 'ENVIRONMENT', choices: ['dev', 'staging', 'prod'], description: 'Deployment environment')
    }
       environment {
        REPO_URL = 'https://github.com/nameson2672/k8-cluster.git'
        REPO_DIR = 'devops-app'
        HELM_VALUES_FILE = "values-${params.ENVIRONMENT}.yaml"
    }
    stages {

    stage('Clone repository') {
        steps {
                // Specify the repository URL and branch explicitly
                git branch: 'main', url: 'https://github.com/nameson2672/k8-cluster.git'
            }
    }

    stage('Update GIT') {
         steps {
        script {
            catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                withCredentials([usernamePassword(credentialsId: 'github', passwordVariable: 'GIT_TOKEN', usernameVariable: 'GIT_USERNAME')]) {
                    sh 'git config user.email "namesongaudel.ng@gmail.com"'
                    sh 'git config user.name Jenkins'
                    sh """
                    sed -i 's/^  tag:.*/  tag: "${params.DOCKERTAG}"/' ${REPO_DIR}/${HELM_VALUES_FILE}
                    """
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
}
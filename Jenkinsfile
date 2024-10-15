pipeline {
    agent any
    
    stages {
        stage('Determine Environment') {
            steps {
                script {
                    if (env.BRANCH_NAME == 'master') {
                        load 'Jenkinsfile.master'
                    } else if (env.BRANCH_NAME == 'staging') {
                        load 'Jenkinsfile.stage'
                    } else {
                        error "Unsupported branch: ${env.BRANCH_NAME}"
                    }
                }
            }
        }
    }
}

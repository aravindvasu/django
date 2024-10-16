pipeline {
    agent any
    
    stages {
        stage('Determine Environment') {
            steps {
                script {
                    def jenkinsfilePath
                    
                    switch(env.BRANCH_NAME) {
                        case 'dev':
                            jenkinsfilePath = 'jenkins/Jenkinsfile.dev'
                            break
                        case 'staging':
                            jenkinsfilePath = 'jenkins/Jenkinsfile.staging'
                            break
                        default:
                            error "Unsupported branch: ${env.BRANCH_NAME}"
                    }
                    
                    if (fileExists(jenkinsfilePath)) {
                        load jenkinsfilePath
                    } else {
                        error "Jenkinsfile not found: ${jenkinsfilePath}"
                    }
                }
            }
        }
    }
}

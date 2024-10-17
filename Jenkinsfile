pipeline {
    agent any
    
    stages {
        stage('Load Environment Pipeline') {
            steps {
                script {
                    def envPipeline
                    
                    switch(env.BRANCH_NAME) {
                        case 'dev':
                            envPipeline = load 'jenkins/Jenkinsfile.dev'
                            break
                        case 'staging':
                            envPipeline = load 'jenkins/Jenkinsfile.staging'
                            break
                        default:
                            error "Unsupported branch: ${env.BRANCH_NAME}"
                    }
                    
                    // Execute the environment-specific pipeline
                    envPipeline.call()
                }
            }
        }
    }
}

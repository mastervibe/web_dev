pipeline {
    agent { label 'master' }
    stages {
        stage ('commit message check') {
            when { expression { env.CHANGE_ID != null } }
            steps {
                script {
                    try {
                        sshagent(['malachite-git-ssh']) {
                            sh "git remote remove origin"
                            sh "git remote add -t master -t ${env.CHANGE_BRANCH} -f --no-tags origin git@github.com:green-fox-academy/teaching-materials.git"
                        }
                        sh "bash check-commit-messages.sh ${env.CHANGE_BRANCH}"
                    }
                    catch (err) {
                        currentBuild.result = 'FAILED'
                        error('Commit message check has failed: ' + err.getMessage())
                    }
                }
            }
        }
        stage ('stylecheck') {
            agent {
                docker {
                    image 'greenfox/markdown-tools:latest'
                }
            }
            steps {
                script {
                    try {
                        sh 'mkdir -p /usr/tools/lint'
                        sh 'cp -r ./ /usr/tools/lint/'
                        sh 'cd /usr/tools && npm run stylecheck'
                    }
                    catch (exc) {
                        currentBuild.result = 'FAILED'
                    }
                }
            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }
}

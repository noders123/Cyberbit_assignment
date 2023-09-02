pipeline {
    agent {
        label 'my-agent'
    }
    stages {
        stage('Build') {
            steps {
                script {
                    sh 'python3 /tmp/zip_job.py' // Run zip_job.py
                }
            }
        }
        stage('Publish') {
            when {
                expression { currentBuild.resultIsBetterOrEqualTo('SUCCESS') }
            }
            steps {
                script {
                    def serverUrl = 'http://192.168.8.140:8082' // Replace with your Artifactory URL
                    def username = 'superman'
                    def password = 'P@ssw0rd123$'
                    def repository = "artifactory/my-repository/${env.VERSION}"

                    def zipFiles = sh(script: 'ls /home/jenkins/workspace/shay-pipeline/zippedfiles/*.zip', returnStdout: true).trim().split('\n')

                    zipFiles.each { zipFile ->
                        sh "curl -u ${username}:${password} -X PUT ${serverUrl}/${repository}/${zipFile} -T ${zipFile}"
                    }
                }
            }
        }
    }
    post {
        always {
            cleanWs() // Cleanup workspace
        }
    }
}

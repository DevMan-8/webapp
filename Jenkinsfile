pipeline {
    // agent any
    agent { label  'workernode1'}        // Can Set the Agent Machine Globally

    stages {
        stage('Docker Build') {
            // agent { label  'workernode1'}
            steps {
                sh 'docker build -t giggly/webapp:latest .'
            }
        }
        stage('Docker Push') {
            // agent { label  'workernode1'}
            steps {
                withDockerRegistry(credentialsId: 'DockerHub', url: 'https://index.docker.io/v1/') {
                    sh 'docker push giggly/webapp:latest'
                }
            }
        }

        stage('CD Stage') {
            // agent { label  'workernode1'}
            steps {
                withDockerRegistry(credentialsId: 'DockerHub', url: 'https://index.docker.io/v1/') {
                    sh '''
                    docker kill nginx
                    docker run -d --rm -p 81:80 --name nginx giggly/webapp:latest
                    '''
                }
            }
        }
    }
}

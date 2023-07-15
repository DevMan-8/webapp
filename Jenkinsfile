pipeline {
     agent any

    stages {
        stage('Docker Build') {
            agent { label  'worknode'}
            steps {
                sh 'docker build -t giggly/webapp:latest .'
            }
        }
        stage('Docker Push') {
            agent { label  'worknode'}
            steps {
                withDockerRegistry(credentialsId: 'DockerHub', url: 'https://hub.docker.com/repository/docker/holdingcontainer/secondproject/general') {
                    sh 'docker push giggly/webapp:latest'
                }
            }
        }

        stage('CD Stage') {
            agent { label  'worknode'}
            steps {
                withDockerRegistry(credentialsId: 'DockerHub', url: 'https://hub.docker.com/repository/docker/holdingcontainer/secondproject/general') {
                    sh '''
                    docker kill nginx
                    docker run -d --rm -p 81:80 --name nginx giggly/webapp:latest
                    '''
                }
            }
        }
    }
}

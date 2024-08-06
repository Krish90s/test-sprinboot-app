pipeline {
    agent any
    stages {
        stage('Clone Repository') {
            steps {
                git url: 'https://github.com/Krish90s/test-sprinboot-app.git', credentialsId: 'github-credentials'
            }
        }
        stage('Build') {
            steps {
                sh './mvnw clean package'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("your-docker-repo/your-app:${env.BUILD_ID}")
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'dockerhub-credentials') {
                        dockerImage.push()
                    }
                    sshagent(['your-ssh-credentials']) {
                        sh '''
                        docker pull your-docker-repo/your-app:${BUILD_ID}
                        docker stop your-app || true
                        docker rm your-app || true
                        docker run -d -p 8080:8080 --name your-app your-docker-repo/your-app:${BUILD_ID}
                        '''
                    }
                }
            }
        }
    }
}

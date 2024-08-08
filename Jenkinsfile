pipeline {
    agent any

    environment {
        // Define variables
        REPOSITORY_URL = 'https://github.com/Krish90s/test-sprinboot-app'
        DOCKER_IMAGE = 'test-springboot-api'
        CONTAINER_NAME = 'test-springboot-container'
    }

    stages {
        stage('Clone Repository') {
            steps {
                // Clone the Git repository
                git url: "${REPOSITORY_URL}", branch: 'master'
            }
        }

         stage('Build with Maven') {
            steps {
                // Run Maven build to generate the JAR file
                sh 'mvn clean package'
            }
        }

        stage('Build Docker Image') {
            steps {
                // Build the Docker image
                script {
                    sh "docker build -t ${DOCKER_IMAGE} ."
                }
            }
        }

        stage('Deploy to EC2') {
            steps {
                // Deploy the Docker container on EC2
                script {
                    sh '''
                    docker stop ${CONTAINER_NAME} || true
                    docker rm ${CONTAINER_NAME} || true
                    docker run -d -p 8080:8080 --name ${CONTAINER_NAME} ${DOCKER_IMAGE}
                    '''
                }
            }
        }
    }

    post {
        always {
            // Clean up workspace
            cleanWs()
        }
    }
}

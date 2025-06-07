pipeline {
    agent any

    environment {
        IMAGE_NAME = 'nptheshark/jenkins-flask-app'
        IMAGE_TAG = "${IMAGE_NAME}:${env.GIT_COMMIT}"
    }

    stages {
        stage('Install Dependencies') {
            steps {
                sh '''
                    python3 -m venv venv
                    . venv/bin/activate
                    pip install --upgrade pip
                    pip install -r requirements.txt
                '''
            }
        }


        stage('Setup') {
            steps {
                echo "Running Setup"

                
            }
        }
        stage('Test') {
            steps {
                
                  sh '''
                    . venv/bin/activate
                    pytest
                '''
                
            }
        } 

        stage('login to dockerhub'){
            steps{
                withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                    sh '''
                        echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin
                        echo "Logged in to Docker Hub"
                    '''
                }
            }
        }   
        stage('Build Docker Image') {
            steps {
                sh '''
                    docker build -t $IMAGE_TAG .
                    echo "Docker image built: $IMAGE_TAG"
                    docker image ls
                '''
            }

                }
        stage('Push Docker Image') {
            steps {
                sh '''
                    docker push $IMAGE_TAG
                    echo "Docker image pushed: $IMAGE_TAG"
                '''
              }
            
            }
        stage('Deployment') {
            input {
                message "Do you want to proceed further?"
                ok "Yes"
            }
            steps {
                echo "Running Deployment"
                
            }
        } 
        
            
    }
}
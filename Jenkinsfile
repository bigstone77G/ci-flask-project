pipeline {
    agent any
    environment {
        VENV = "venv"
        SONAR_HOST_URL = 'http://localhost:9000'
        SONAR_LOGIN = credentials('sonar-token')
    }
    stages {
        stage('Setup Python Env') {
            steps {
                bat 'python -m venv %VENV%'
                bat '%VENV%\\Scripts\\activate && python -m pip install --upgrade pip'
                bat '%VENV%\\Scripts\\activate && pip install -r requirements.txt'
            }
        }
        stage('Run Tests') {
            steps {
                bat '%VENV%\\Scripts\\activate && pytest --cov=app tests/'
            }
        }
        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('sonar-server') {
                    bat '%VENV%\\Scripts\\activate && sonar-scanner -Dsonar.projectKey=ci-flask-project -Dsonar.sources=app'
                }
            }
        }
    }
    post {
        always {
            junit 'tests/reports/*.xml'
        }
    }
}

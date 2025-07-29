pipeline {
    agent any

    environment {
        VENV = "venv"
        SONAR_HOST_URL = 'http://localhost:9000'  // adapte selon ton serveur SonarQube
        SONAR_LOGIN = credentials('sonar-token')  // Crée un secret Jenkins avec ton token SonarQube
    }

    stages {
        stage('Setup Python Env') {
            steps {
                sh 'python -m venv $VENV'
                sh '. $VENV/bin/activate && python -m pip install --upgrade pip'
                sh '. $VENV/bin/activate && pip install -r requirements.txt'
            }
        }

        stage('Run Tests') {
            steps {
                sh '. $VENV/bin/activate && pytest --cov=app tests/'
            }
        }

        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('sonar-server') {
                    sh ". $VENV/bin/activate && sonar-scanner -Dsonar.projectKey=ci-flask-project -Dsonar.sources=app"
                }
            }
        }
    }

    post {
        always {
            junit 'tests/reports/*.xml'   // si tu as des rapports junit
            publishHTML(target: [
                reportDir: 'htmlcov', 
                reportFiles: 'index.html', 
                reportName: 'Coverage Report'
            ])
        }
    }
}


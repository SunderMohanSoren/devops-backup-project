pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/SunderMohanSoren/devops-backup-project.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t backup-tool -f docker/Dockerfile .'
            }
        }

        stage('Run Backup Container') {
            steps {
                sh '''
                docker run --rm \
                  -v $WORKSPACE/data:/app/data \
                  -v $WORKSPACE/backups:/app/backups \
                  backup-tool
                '''
            }
        }

        stage('Archive Backups') {
            steps {
                archiveArtifacts artifacts: 'backups/*.tar.gz', fingerprint: true
            }
        }
    }
}

pipeline {
    agent {
        docker {
            image 'maven:3.9.5-eclipse-temurin-17'
            args '-v /root/.m2:/root/.m2'
        }
    }

    environment {
        BROWSER_HOST = "chrome"  // name of Chrome container in docker-compose
    }

    stages {
        stage('Build') {
            steps {
                echo "Building the Maven project..."
                sh 'mvn clean install -DskipTests'
            }
        }

        stage('Run Tests') {
            steps {
                echo "Running TestNG tests..."
                sh '''
                  mvn test \
                  -Dwebdriver.remote.url=http://$BROWSER_HOST:4444/wd/hub
                '''
            }
        }
    }

    post {
        always {
            echo "Pipeline completed. Archiving reports if needed."
            junit 'target/surefire-reports/*.xml'
        }
    }
}

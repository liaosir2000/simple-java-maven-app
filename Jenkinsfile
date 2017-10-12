pipeline {
    agent {
        docker {
            image 'maven:3-alpine'
            args '-v /Users/glodon/.m2:/root/.m2'
        }
    }
    stages {
        stage('Build') {
            steps {
                sh 'mvn -B -DskipTests clean package'
            }
        }
        stage('BuildImage') {
            steps {
                sh ''' docker build -t registry.glodon.com:5000/simple-app:t_$BUILD_NUMBER .'''
            }
        }
        stage('PushImage') {
            steps {
                sh ''' docker push registry.glodon.com:5000/simple-app:t_$BUILD_NUMBER '''
            }
        }
    }
}

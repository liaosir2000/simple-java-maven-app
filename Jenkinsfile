pipeline {
    agent none
    stages {
      stage('MvnBuild') {
        agent {
          docker {
            image 'maven:3-alpine'
            args '-v /Users/glodon/.m2:/root/.m2'
          }
        }
        steps {
          sh 'mvn -B -DskipTests clean package'
        }
      }
      stage('ImageBuild') {
        agent any
        steps {
          sh ''' docker build -t registry.bimface.com:5000/simple-app:t_$BUILD_NUMBER .'''
          sh ''' docker push registry.bimface.com:5000/simple-app:t-$BUILD_NUMBER '''
        }
      }
    }
}

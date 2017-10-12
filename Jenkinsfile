pipeline {
    agent none
    stages {
      stage('MvnBuild') {
        agent {
          image 'maven:3-alpine'
          args '-v /Users/glodon/.m2:/root/.m2'
        }
        steps {
          sh 'mvn -B -DskipTests clean package'
        }
      }
      stage('ImageBuild') {
        agent any
        steps {
          sh ''' docker build -t registry.glodon.com:5000/simple-app:t_$BUILD_NUMBER .'''
          sh ''' docker push registry.glodon.com:5000/simple-app:t_$BUILD_NUMBER '''
        }
      }
    }
}

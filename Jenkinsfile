node() {

try {
    stage('Code Checkout') {
       checkout scm
       sh "ls -ltr"
    }
    stage('Build Docker Image and Push'){
         docker.withTool('docker') {
            def customImage = docker.build("yashgandam/yash-node:${env.BRANCH_NAME}${BUILD_NUMBER}")
          }
          withDockerRegistry(credentialsId: 'dockercreds', url: 'https://index.docker.io/v1/') {
              customImage.push()            
           }
    }
    
  //  stage('Deploy App'){
    //    sh "cd ${WORKSPACE}; sh kube_config.sh"
    //    sh "kubectl set image deployment/ssp-nodejs-deployment ssp-nodejs=ssp25/ssp-nodejs-online:${env.BRANCH_NAME}${BUILD_NUMBER} --context=sspcloudpro.co.in --namespace=default"
   // }


}
catch (e) {
currentBuild.result = "FAILED"
 echo "${e.getClass().getName()} - ${e.getMessage()}"
 throw e
}
    
}


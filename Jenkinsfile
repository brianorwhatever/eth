#!groovy

REGION = 'ca-central-1'
def ACCOUNTS = [dev: '900910879607']
ACCOUNT = ACCOUNTS['dev']
REGISTRY = ACCOUNT + '.dkr.ecr.ca-central-1.amazonaws.com'

node("$ENV") {
    stage('build-and-push') {
        deleteDir()
        checkout scm
        def ret = sh script: "git rev-parse --short HEAD", returnStdout: true
        def sha = ret.trim()
        def image = "brian-ethereum-$ENV-ca-central-1:$sha"
        echo "Image: $image"
        sh """\$(AWS_DEFAULT_REGION=ca-central-1 aws ecr get-login)"""
        docker.withRegistry("https://$REGISTRY") {
            def eth = docker.build("$image", "--rm --build-arg aws_default_region=$REGION .")
            eth.push()
            eth.push('latest')
        }
        sh """docker rmi $image"""
    }
}

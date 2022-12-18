<b>The project contains 2 Jenkins pipelines. </b>

1- pipeline using Terraform creates a gateway in AWS Lamda and API with loading a JS script.

2- pipeline creates a docker build, push to remote container repository , and deploy container to  kubernetes cluster.

<hr>

content :

1_jenkinsfile_Lambda_API gateway_wit - contains pipeline
2_jenkinsfile_deploy_k8s - contains the pipeline
terraform - terraform modules with JS script archive
k8 - kubernetes deployment configuration

docker build repo and js app - https://github.com/asiamegic/docker-node-hello-world

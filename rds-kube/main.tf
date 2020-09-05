resource "null_resource" "minikubeservice" {
  provisioner "local-exec" {
    command = "minikube service list"
    
  }
    depends_on = [
      kubernetes_deployment.wordpress,
      kubernetes_service.wordpresslb,
      aws_db_instance.mydb
      ]
}
# 1. Definición del Provider (El "conector")
terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.18"
    }
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config" # Usa tu acceso de AWS local
}

# 2. El Deployment (Las 2 réplicas de Nginx)
resource "kubernetes_deployment" "nginx" {
  metadata {
    name = "tf-nginx-deployment"
    labels = {
      app = "tf-nginx"
    }
  }

  spec {
    replicas = 10
    selector {
      match_labels = {
        app = "tf-nginx"
      }
    }
    template {
      metadata {
        labels = {
          app = "tf-nginx"
        }
      }
      spec {
        container {
          image = "nginx:1.21.6"
          name  = "nginx"
          port {
            container_port = 80
          }
        }
      }
    }
  }
}

# 3. El Service (El LoadBalancer de AWS)
resource "kubernetes_service" "nginx" {
  metadata {
    name = "tf-nginx-service"
  }
  spec {
    selector = {
      # Esta línea es clave: vincula el servicio al deployment automáticamente
      app = kubernetes_deployment.nginx.metadata[0].labels.app
    }
    # session_affinity = "ClientIP"
    port {
      port        = 80
      target_port = 80
    }
    type = "LoadBalancer"
  }
}
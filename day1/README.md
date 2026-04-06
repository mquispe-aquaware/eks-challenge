# Day 1: EKS Cluster Provisioning con IaC 🏗️

Configuración de un clúster de Kubernetes en **AWS EKS** utilizando
**Infraestructura como Código (IaC)**.

## 🛠️ Herramientas

-   **AWS EKS** -- Kubernetes administrado en AWS\
-   **eksctl** -- CLI para crear y gestionar clústeres EKS\
-   **GitHub Actions** -- Pipeline CI/CD para automatizar el despliegue\
-   **kubectl** -- CLI para interactuar con Kubernetes

## 🌐 Arquitectura

-   **Región:** us-east-2 (Ohio)\
-   **Nodos:** 2 instancias `t3.small` (Managed Node Group)\
-   **Red:** VPC con subredes públicas y privadas creada
    automáticamente\
-   **IAM Roles:** Permisos para registrar nodos en el Control Plane

## 🚀 Comandos principales

``` bash
# Crear el cluster
eksctl create cluster   --name mrk-dev-challenge   --region us-east-2   --node-type t3.small   --nodes 2

# Configurar acceso al cluster
aws eks update-kubeconfig   --region us-east-2   --name mrk-dev-challenge

# Verificar nodos
kubectl get nodes
```

## 🧹 Limpieza de recursos

``` bash
eksctl delete cluster --name mrk-dev-challenge --region us-east-2
```

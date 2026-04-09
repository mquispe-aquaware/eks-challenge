# Día 2: Orquestación con Kubernetes (Manifiestos YAML)

En esta etapa del challenge, dejamos de lado la infraestructura física y nos enfocamos en la **capa de aplicación** dentro del clúster EKS utilizando archivos de configuración declarativos (`.yaml`).

## 🎯 Objetivos
- Desplegar una aplicación web (Nginx) usando un `Deployment`.
- Exponer la aplicación al mundo exterior mediante un `Service` de tipo `LoadBalancer`.
- Practicar el escalado manual de réplicas.

## 🛠️ Recursos Creados
1. **Deployment (`nginx-deployment.yaml`)**: Define que queremos 5 réplicas del contenedor Nginx corriendo en el clúster.
2. **Service (`nginx-service.yaml`)**: Crea un Elastic Load Balancer (ELB) en AWS que redirige el tráfico hacia los Pods.

## 💻 Comandos Utilizados
```bash
# Aplicar los archivos al clúster
kubectl apply -f nginx-deployment.yaml
kubectl apply -f nginx-service.yaml

# Verificar el estado de los Pods y dónde están corriendo
kubectl get pods -o wide

# Obtener la URL externa del Load Balancer
kubectl get svc nginx-service
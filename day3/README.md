

### 📂 Carpeta: `day3/README.md`

```markdown
# Día 3: Infraestructura como Código con Terraform

En este día, elevamos el nivel de automatización reemplazando los archivos YAML manuales por **Terraform**, permitiendo gestionar el ciclo de vida de la aplicación de forma profesional y rastreable.

## 🎯 Objetivos
- Migrar el despliegue de Nginx de YAML a HCL (HashiCorp Configuration Language).
- Gestionar el **Estado (State)** de la infraestructura.
- Resolver conflictos de configuración en vivo.

## 🚀 El Ciclo de Vida de Terraform
Practicamos los tres comandos esenciales:
1. `terraform plan`: Simulación de cambios.
2. `terraform apply`: Ejecución y creación de recursos en el clúster.
3. `terraform destroy`: Limpieza total de los recursos gestionados.

## 🔧 Resolución de Problemas (Troubleshooting)
Durante el despliegue, nos enfrentamos a retos reales de un DevOps Engineer:
- **Error de Identidad:** Corregido mediante `terraform state rm` e `terraform import` para sincronizar la memoria de Terraform con la realidad del clúster.
- **Configuración No Soportada:** Eliminamos `session_affinity = "ClientIP"` ya que el Classic Load Balancer de AWS no lo soporta de forma nativa en esta capa.

## 📈 Escalado Dinámico
Cambiamos la variable `replicas = 2` a `replicas = 10` en el archivo `main.tf`, demostrando cómo una sola línea de código puede escalar una infraestructura entera en segundos.

## 💻 Comandos Clave
```bash
terraform init    # Inicializa los plugins de Kubernetes
terraform plan    # Revisa qué va a pasar
terraform apply   # Hace la magia realidad
terraform destroy # Borra el deployment y el service
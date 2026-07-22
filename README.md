
![Docker](https://img.shields.io/badge/Docker-Containerized-blue?logo=docker&logoColor=white)
![Kubernetes](https://img.shields.io/badge/Kubernetes-Orchestrated-326CE5?logo=kubernetes&logoColor=white)
![GitHub Actions](https://img.shields.io/badge/GitHub%20Actions-CI%2FCD-2088FF?logo=github&logoColor=white)
![Node.js](https://img.shields.io/badge/Node.js-22.x-green?logo=node.js&logoColor=white)
![Terraform](https://img.shields.io/badge/Terraform-IaC-623CE4?logo=terraform&logoColor=white)
![License](https://img.shields.io/badge/License-ISC-blue)
![Platform](https://img.shields.io/badge/Platform-Microsoft_Azure-0078D4?ftazure&logoColor=white)
![Status](https://img.shields.io/badge_Development-orange)
 
# Azure LAMP Platform

Plataforma Infrastructure as Code (IaC) para desplegar, automatizar y monitorizar aplicaciones PHP utilizando tecnologías modernas de DevOps, CI/CD y observabilidad.

## Tecnologías

- Azure (en preparación)
- Terraform
- Ansible
- Jenkins
- Docker
- Apache
- PHP 8.3
- MySQL 8.4
- Prometheus
- Node Exporter
- GitHub Actions

---

# Objetivos del Proyecto

Este proyecto persigue los siguientes objetivos:

- Automatización completa de infraestructura.
- Configuración como código.
- Integración continua y despliegue continuo (CI/CD).
- Observabilidad y monitorización.
- Entornos reproducibles.
- Preparación para despliegues en Azure.

---

# Arquitectura Actual

```text
Docker Compose
│
├── Jenkins
├── PHP + Apache
├── MySQL
├── phpMyAdmin
│
├── Prometheus
└── Node Exporter
```

---

# Arquitectura Objetivo

```text
GitHub
   │
   ▼
GitHub Actions
   │
   ▼
Terraform
   │
   ▼
Azure
   │
   ▼
Ansible
   │
   ▼
Jenkins
   │
   ▼
Aplicación PHP
```

---

# Requisitos

## Windows

- Docker Desktop
- WSL2
- Git

## Linux

- Docker
- Docker Compose
- Git

---

# Verificación de instalación

```bash
docker --version

docker compose version

git --version
```

---

# Instalación

## Clonar repositorio

```bash
git clone https://github.com/fmartinezaltolaguirre/azure-lamp-platform.git

cd azure-lamp-platform
```

---

## Crear fichero de configuración

```bash
cp .env.example .env
```

---

## Levantar entorno

```bash
docker compose up -d --build
```

---

## Comprobar estado

```bash
docker ps
```

---

# Servicios Disponibles

| Servicio | URL |
|-----------|-----------|
| Jenkins | http://localhost:8080 |
| Aplicación PHP | http://localhost:8082 |
| phpMyAdmin | http://localhost:8081 |
| Prometheus | http://localhost:9091 |
| Node Exporter | http://localhost:9100/metrics |

---

# Jenkins

Acceso:

```text
http://localhost:8080
```

Obtener contraseña inicial:

```bash
docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword
```

---

# Aplicación PHP

Acceso:

```text
http://localhost:8082
```

Aplicación de ejemplo utilizada para validar despliegues y futuras pipelines CI/CD.

---

# phpMyAdmin

Acceso:

```text
http://localhost:8081
```

Credenciales por defecto:

```text
Servidor: mysql

Usuario: appuser

Contraseña: apppassword
```

---

# Prometheus

Prometheus es el sistema de recolección y almacenamiento de métricas de la plataforma.

Acceso:

```text
http://localhost:9091
```

---

## Targets configurados

Actualmente Prometheus monitoriza:

- Prometheus
- Node Exporter

Comprobar estado:

```text
Status → Target Health
```

Todos los targets deben aparecer como:

```text
UP
```

---

## Consultas PromQL útiles

### CPU

```promql
rate(node_cpu_seconds_total[5m])
```

### Memoria disponible

```promql
node_memory_MemAvailable_bytes
```

### Memoria total

```promql
node_memory_MemTotal_bytes
```

### Uso de disco

```promql
node_filesystem_size_bytes
```

---

# Node Exporter

Node Exporter proporciona métricas del sistema operativo y del host Docker.

Acceso directo:

```text
http://localhost:9100/metrics
```

---

## Métricas disponibles

- CPU
- RAM
- Disco
- Sistema de archivos
- Interfaces de red
- Load Average
- Procesos
- Estadísticas del kernel

---

# Variables de Entorno

Archivo:

```text
.env
```

Ejemplo:

```env
JENKINS_ADMIN_PASSWORD=admin123

MYSQL_ROOT_PASSWORD=rootpassword

MYSQL_DATABASE=appdb

MYSQL_USER=appuser

MYSQL_PASSWORD=apppassword
```

---

# Estructura del Proyecto

```text
azure-lamp-platform/
│
├── .github/
│   └── workflows/
│
├── terraform/
│   ├── modules/
│   └── environments/
│
├── ansible/
│   ├── inventory/
│   └── roles/
│
├── jenkins/
│   ├── casc/
│   ├── jobs/
│   ├── plugins.txt
│   └── Dockerfile
│
├── app/
│   └── sample-php-app/
│
├── monitoring/
│   └── prometheus/
│       └── prometheus.yml
│
├── docs/
│
├── scripts/
│
├── docker-compose.yml
├── README.md
├── .env.example
└── .gitignore
```

---

# Comandos Útiles

## Arrancar servicios

```bash
docker compose up -d
```

## Reconstruir imágenes

```bash
docker compose up -d --build
```

## Detener servicios

```bash
docker compose down
```

## Reiniciar servicios

```bash
docker compose restart
```

## Ver estado

```bash
docker ps
```

## Ver logs

```bash
docker compose logs -f
```

## Logs de un servicio

```bash
docker compose logs -f prometheus

docker compose logs -f jenkins

docker compose logs -f mysql
```

---

# Estado Actual

## Plataforma

- [x] Docker Compose
- [x] Jenkins
- [x] PHP 8.3 + Apache
- [x] MySQL 8.4
- [x] phpMyAdmin

## Monitorización

- [x] Prometheus
- [x] Node Exporter
- [ ] Grafana
- [ ] Alertmanager
- [ ] cAdvisor
- [ ] Loki
- [ ] Promtail
- [ ] OpenTelemetry
- [ ] Jaeger

## Infraestructura

- [x] Estructura Terraform
- [x] Estructura Ansible
- [x] Jenkins as Code
- [ ] Azure Deployment

---

# Roadmap

## Fase 1

- Repositorio GitHub
- Docker Compose
- Jenkins
- PHP
- MySQL
- phpMyAdmin

## Fase 2

- Prometheus
- Node Exporter
- Grafana
- Alertmanager
- cAdvisor

## Fase 3

- Jenkins Shared Library
- CI/CD
- GitHub Webhooks

## Fase 4

- Terraform Azure
- Provisioning automático
- Entorno DEV

## Fase 5

- QA
- Producción
- Azure Database for MySQL
- Azure Key Vault

## Fase 6

- Loki
- OpenTelemetry
- Jaeger
- Dashboards avanzados

---

# Seguridad

Nunca subir al repositorio:

```text
.env
*.pem
*.key
*.pfx
*.tfstate
terraform.tfvars
id_rsa
id_ed25519
```

Verificar que estos elementos aparecen en `.gitignore`.

---

# Versionado

Crear una nueva versión:

```bash
git tag v0.1.0

git push origin v0.1.0
```

Listar versiones:

```bash
git tag
```

---

# Autor

Fernando Martínez Altolaguirre

Repositorio:

```text
https://github.com/fmartinezaltolaguirre/azure-lamp-platform
```

---

# Licencia

MIT License

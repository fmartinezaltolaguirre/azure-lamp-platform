# Azure LAMP Platform

Plataforma Infrastructure as Code (IaC) para desplegar y gestionar un entorno completo basado en:

- Azure
- Terraform
- Ansible
- Jenkins
- Apache
- PHP
- MySQL
- Docker
- GitHub Actions

---

# Arquitectura

```text
GitHub
   ↓
GitHub Actions
   ↓
Terraform
   ↓
Azure
   ↓
Ansible
   ↓
Jenkins
   ↓
Aplicaciones PHP
```

---

# Entorno Local

Actualmente el proyecto permite levantar un entorno completo de desarrollo utilizando Docker Compose.

Servicios incluidos:

- Jenkins
- PHP 8.3 + Apache
- MySQL 8.4
- phpMyAdmin

---

# Requisitos

## Windows

- Docker Desktop
- WSL2

## Linux

- Docker Engine
- Docker Compose

Verificación:

```bash
docker --version
docker compose version
```

---

# Primer Arranque

## Clonar el repositorio

```bash
git clone https://github.com/fmartinezaltolaguirre/azure-lamp-platform.git

cd azure-lamp-platform
```

## Crear variables de entorno

```bash
cp .env.example .env
```

## Levantar la plataforma

```bash
docker compose up -d
```

## Verificar servicios

```bash
docker ps
```

---

# Acceso a Servicios

## Jenkins

URL:

```text
http://localhost:8080
```

Obtener contraseña inicial:

```bash
docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword
```

---

## Aplicación PHP

URL:

```text
http://localhost:8082
```

---

## phpMyAdmin

URL:

```text
http://localhost:8081
```

Parámetros de conexión:

```text
Servidor: mysql
Usuario: appuser
Contraseña: apppassword
```

---

# Configuración

## Variables de entorno

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
│
├── ansible/
│
├── jenkins/
│   ├── casc/
│   ├── plugins.txt
│   └── Dockerfile
│
├── pipelines/
│
├── app/
│   └── sample-php-app/
│
├── docs/
│
├── scripts/
│
├── docker-compose.yml
├── .env.example
├── README.md
└── .gitignore
```

---

# Comandos Útiles

## Arrancar servicios

```bash
docker compose up -d
```

## Detener servicios

```bash
docker compose down
```

## Reiniciar servicios

```bash
docker compose restart
```

## Ver contenedores

```bash
docker ps
```

## Ver logs

```bash
docker compose logs -f
```

## Reconstruir imágenes

```bash
docker compose build --no-cache
```

## Reconstruir y arrancar

```bash
docker compose up -d --build
```

---

# Desarrollo

## Modificar la aplicación PHP

Los archivos de la aplicación se encuentran en:

```text
app/sample-php-app/public
```

Ejemplo:

```text
app/sample-php-app/public/index.php
```

Los cambios estarán disponibles inmediatamente gracias al volumen Docker configurado.

---

# Roadmap

## Fase 1

- [x] Estructura del repositorio
- [x] Docker Compose
- [x] Jenkins
- [x] PHP + Apache
- [x] MySQL
- [x] phpMyAdmin

## Fase 2

- [ ] Jenkins Configuration as Code
- [ ] Shared Library Jenkins
- [ ] Integración GitHub
- [ ] Webhooks
- [ ] Pipelines automáticos

## Fase 3

- [ ] Terraform Azure
- [ ] Ansible Automation
- [ ] Provisioning automático
- [ ] Entornos DEV

## Fase 4

- [ ] Entornos QA
- [ ] Entornos PROD
- [ ] Azure Database for MySQL
- [ ] Azure Key Vault

## Fase 5

- [ ] Observabilidad
- [ ] Prometheus
- [ ] OpenTelemetry
- [ ] Jaeger
- [ ] Dashboards

---

# Seguridad

No subir nunca al repositorio:

```text
.env
*.pem
*.key
*.pfx
*.tfsta*e
terraform.tfvars
id_rsa
id_ed255*9
```

Verifica que los archivos s*nsibles están incluidos en `.gitig*ore`.

---

# Versionado

Crear un* release:

```bash
git tag v0.1.0
*git push origin v0.1.0
```

Ver et*quetas:

```bash
git tag
```

---
*# Contribución

1. Crear rama:

``*bash
git checkout -b feature/nueva*funcionalidad
```

2. Realizar cam*ios.

3. Commit:

```bash
git comm*t -m "Add new feature"
```

4. Pus*:

```bash
git push origin feature*nueva-funcionalidad
```

5. Crear *ull Request.

---

# Licencia

MIT*License

Copyright © Fernando Mart*nez Altolaguirre

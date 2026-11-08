---
proyecto: "{{PROJECT_NAME}}"
tipo: "Plantilla Base / Repositorio Modelo"
entorno_principal: "Podman / Docker / OCI Containers"
arquitectura: "Separación Modular / Staging -> Main"
estado: "En Desarrollo / Plantilla Lista"
version: "1.0.0"
ultima_actualizacion: "2026-11-07"
tags:
  - template
  - devcontainer
  - github-actions
  - ghcr
  - podman
  - docker
---

# 🚀 {{PROJECT_NAME}}

> [!NOTE]
> **REPOSITORIO PLANTILLA (TEMPLATE):**  
> Este proyecto define la línea base de desarrollo, gobierno de código y pipelines de integración continua. Emplea un ciclo de dos ramas (`develop` para integración y pruebas, y `main` para entregables estables de producción).

---

### 🛡️ Estado del Proyecto y Métricas

![GitHub default branch](https://img.shields.io/badge/branch-develop-blue)
![Main Protected](https://img.shields.io/badge/main-protected-green)
![Container Runtime](https://img.shields.io/badge/runtime-Podman%20%7C%20Docker-blueviolet)
![Registry](https://img.shields.io/badge/registry-GHCR-blue)
![License](https://img.shields.io/badge/license-MIT-informational)

---

## ⚡ 1. Resumen del Sistema

{{PROJECT_DESCRIPTION}}

Principios del entorno:
1. **Contenedorización Agnóstica:** Diseñado para compilar y ejecutarse indistintamente con **Podman** o **Docker Engine** mediante especificaciones estándar OCI.
2. **Entornos Reproducibles:** Soporte nativo para **Dev Containers** vía `.devcontainer/devcontainer.json` para VS Code o GitHub Codespaces.
3. **Gestión Ágil y Trazabilidad:** Planificación de requerimientos centralizada en `BACKLOG.md` e historial evolutivo regulado bajo el estándar de `CHANGELOG.md`.

---

## 📊 2. Especificación Técnica y Gobernanza

| Componente | Definición / Herramienta | Propósito / Alcance |
| :--- | :--- | :--- |
| **Rama Base (`develop`)** | Default branch | Integración continua, staging y recepción de PRs diarios. |
| **Rama Producción (`main`)** | Protected branch | Entregas estables; bloqueada a commits directos y auto-merges. |
| **Gobernanza de Revisiones** | `.github/CODEOWNERS` | Exige aprobación formal de revisores asignados antes del merge. |
| **Estandarización de PRs** | `PULL_REQUEST_TEMPLATE.md` | Checklist obligatorio de calidad, pruebas y variables de entorno. |
| **Registro de Imágenes** | GitHub Packages (GHCR) | Publicación automática de imágenes OCI (`:staging` y `:latest`). |

---

## 🏗️ 3. Arquitectura del Flujo de Trabajo (Git Workflow)

```text
[ Feature Branch ] ────── (Pull Request) ──────► [ develop (Staging) ]
                                                        │
                               (PR con Aprobación + CI) │
                                                        ▼
                                                [ main (Producción) ]
                                                        │
                                                        ▼
                                                [ GHCR Tag: :latest ]
```

### Reglas de Contribución

- **Commits directos en `main` prohibidos:** Todo cambio debe originarse mediante un Pull Request desde `develop`.
- **Trazabilidad de tareas:** Cada Pull Request o Issue debe incluir obligatoriamente en su título el identificador de la tarea correspondiente de `BACKLOG.md` (ej. `[ID-001]`).
- **Aprobación de Code Owners:** El PR debe contar con la firma aprobada de los revisores asignados en el archivo `CODEOWNERS`.
- **CI en Verde:** El pipeline de GitHub Actions debe compilar la imagen y validar el código satisfactoriamente antes de autorizar el merge.

---

## 📂 4. Árbol Estructural del Repositorio

```text
.
├── .devcontainer/
│   └── devcontainer.json            # Configuración del entorno de desarrollo aislado
├── .github/
│   ├── ISSUE_TEMPLATE/
│   │   ├── bug_report.md            # Plantilla estructurada para reporte de errores
│   │   ├── config.yml               # Configuración para deshabilitar issues vacíos
│   │   └── feature_request.md       # Plantilla estructurada para nuevas propuestas
│   ├── rulesets/
│   │   └── main-protection.json     # Reglas exportadas para blindar la rama main
│   ├── workflows/
│   │   └── ci.yml                   # Pipeline de GitHub Actions (Lint, Build y GHCR)
│   ├── CODEOWNERS                   # Asignación obligatoria de revisores
│   └── PULL_REQUEST_TEMPLATE.md     # Checklist de verificación para Pull Requests
├── .githooks/
│   └── pre-commit                   # Hook local para validar ramas y commits
├── examples-docs/                   # Módulos y extensiones opcionales de infraestructura
│   ├── .env.postgres.example        # Plantilla de variables para PostgreSQL
│   ├── compose.postgres.yaml        # Servicio modular de base de datos PostgreSQL
│   └── sql/
│       └── .gitkeep                 # Carpeta para scripts SQL de inicialización (initdb)
├── .env.example                     # Plantilla de variables de entorno públicas
├── .gitignore                       # Exclusiones globales de Git
├── BACKLOG.md                       # Listado priorizado de tareas y estimación
├── CHANGELOG.md                     # Historial detallado de cambios por versión (SemVer)
├── compose.yaml                     # Orquestación base del servicio de aplicación
├── Dockerfile                       # Receta de construcción OCI del contenedor
└── README.md                        # Documentación técnica operativa
```

---

## 🚀 5. Puesta en Marcha y Entorno Local

### 5.1. Requisitos Previos

- **Motor de contenedores:** [Podman](https://podman.io) o [Docker Engine](https://docs.docker.com/engine/).
- **Compose:** `podman-compose` o Docker Compose v2 (`docker compose`).
- **Cliente Git:** Versión 2.30+ instalada y configurada.

### 5.2. Configuración Inicial

1. Clonar el repositorio y entrar en el directorio del proyecto:
    
    ```bash
    git clone https://github.com/{{GITHUB_OWNER}}/{{PROJECT_NAME}}.git
    cd {{PROJECT_NAME}}
    ```
    
2. Generar el archivo de variables de entorno local:
    
    ```bash
    cp .env.example .env
    ```

---

### 5.3. Ejecución del Servicio Base (Solo Aplicación)

Para compilar y levantar el servicio principal de la aplicación:

```bash
# Con Podman:
podman compose up -d --build

# Con Docker:
docker compose up -d --build
```

Visualizar logs en tiempo real:

```bash
# Con Podman:
podman compose logs -f app

# Con Docker:
docker compose logs -f app
```

---

### 5.4. Ejecución con Base de Datos PostgreSQL (Opcional)

Si el proyecto requiere persistencia de datos relacional local:

1. **Añadir variables de entorno:** Copia el contenido de `examples-docs/.env.postgres.example` al final de tu archivo `.env`.
2. **Levantar ambos servicios orquestados:**

```bash
# Con Podman:
podman compose -f compose.yaml -f examples-docs/compose.postgres.yaml up -d --build

# Con Docker:
docker compose -f compose.yaml -f examples-docs/compose.postgres.yaml up -d --build
```

> [!TIP]
> Cualquier script `.sql` ubicado dentro de `examples-docs/sql/` se ejecutará de forma automática en orden alfabético la primera vez que se inicialice el volumen de datos de PostgreSQL.

---

## 📦 6. Descarga de Imágenes desde GHCR

Para utilizar directamente los artefactos generados por el pipeline de integración continua sin compilar localmente:

```bash
# Versión de staging (originada en develop)
podman pull ghcr.io/{{GITHUB_REPOSITORY}}:staging
# O con Docker:
docker pull ghcr.io/{{GITHUB_REPOSITORY}}:staging

# Versión de producción (originada en main / SemVer)
podman pull ghcr.io/{{GITHUB_REPOSITORY}}:latest
# O con Docker:
docker pull ghcr.io/{{GITHUB_REPOSITORY}}:latest
```

---
> **Mantenimiento y Autoría:** @{{GITHUB_OWNER}}

---
proyecto: "[NOMBRE_DEL_PROYECTO]"
tipo: "Plantilla Base / Repositorio Modelo"
entorno_principal: "Podman / OCI Containers"
arquitectura: "Separación Modular / Staging -> Main"
estado: "En Desarrollo / Plantilla Lista"
version: "1.0.0"
ultima_actualizacion: "2026-09-07"
tags:
  - template
  - devcontainer
  - github-actions
  - ghcr
  - podman
---

# 🚀 [NOMBRE_DEL_PROYECTO]

> [!NOTE]
> **REPOSITORIO PLANTILLA (TEMPLATE):**  
> Este proyecto define la línea base de desarrollo, gobierno de código y pipelines de integración continua. Emplea un ciclo de dos ramas (`develop` para integración y pruebas, y `main` para entregables estables de producción).

---

### 🛡️ Estado del Proyecto y Métricas

![GitHub default branch](https://img.shields.io/badge/Default%20Branch-develop-blue?style=for-the-badge&logo=git&logoColor=white)
![Main Protected](https://img.shields.io/badge/Main-Protected%20Branch-red?style=for-the-badge&logo=github&logoColor=white)
![Container Runtime](https://img.shields.io/badge/Container-Podman%20%7C%20Docker-892CA0?style=for-the-badge&logo=podman&logoColor=white)
![Registry](https://img.shields.io/badge/GHCR-ghcr.io-2088FF?style=for-the-badge&logo=githubactions&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

---

## ⚡ 1. Resumen del Sistema

[Breve descripción de 2 a 3 líneas sobre el objetivo del proyecto, el problema que resuelve y el valor que aporta].

Principios del entorno:
1. **Contenedorización Agnóstica:** Listo para compilar y ejecutarse sin fricción con **Podman** o **Docker** mediante definiciones estándar OCI.
2. **Entornos Reproducibles:** Soporte nativo para **Dev Containers** vía `.devcontainer/devcontainer.json` para VS Code o GitHub Codespaces.
3. **Flujo de Trabajo Estricto:** Restricciones automatizadas en GitHub para asegurar revisiones de código previas a cualquier despliegue.

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
````

### Reglas de Contribución

- **Commits directos en `main` prohibidos:** Todo cambio debe originarse mediante un Pull Request desde `develop`.
    
- **Aprobación de Code Owners:** El PR debe contar con la firma aprobada de los revisores designados en el archivo `CODEOWNERS`.
    
- **CI en Verde:** El pipeline de GitHub Actions debe compilar la imagen y validar el código satisfactoriamente antes de autorizar el merge.
    

## 📂 4. Árbol Estructural del Repositorio

Plaintext

```
.
├── .devcontainer/
│   └── devcontainer.json         # Configuración del entorno de desarrollo aislado
├── .github/
│   ├── ISSUE_TEMPLATE/
│   │   ├── bug_report.md         # Plantilla estructurada para reporte de errores
│   │   ├── config.yml            # Configuración para deshabilitar issues vacíos
│   │   └── feature_request.md    # Plantilla estructurada para nuevas propuestas
│   ├── workflows/
│   │   └── ci.yml                # Pipeline de GitHub Actions (Lint, Build y GHCR)
│   ├── CODEOWNERS                # Asignación obligatoria de revisores
│   └── PULL_REQUEST_TEMPLATE.md  # Checklist de verificación para Pull Requests
├── .env.example                  # Plantilla de variables de entorno públicas
├── .gitignore                    # Exclusiones de Git
├── compose.yaml                  # Orquestación multicontenedor (compatible con Podman)
├── Dockerfile                    # Receta de construcción OCI del contenedor
└── README.md                     # Documentación general del proyecto
```

## 🚀 5. Puesta en Marcha y Entorno Local

### 5.1. Requisitos Previos

- **Motor de contenedores:** [Podman](https://podman.io/) (recomendado) o Docker Engine / Docker Desktop.
    
- **Cliente Git:** Versión 2.30+ instalada y configurada.
    

### 5.2. Configuración Inicial

1. Clonar el repositorio y entrar en la carpeta del proyecto:
    
    Bash
    
    ```
    git clone [https://github.com/](https://github.com/)[USUARIO]/[REPOSITORIO].git
    cd [REPOSITORIO]
    ```
    
2. Preparar el archivo de variables de entorno:
    
    Bash
    
    ```
    cp .env.example .env
    ```
    

### 5.3. Construcción y Ejecución con Podman / Docker

Compilar la imagen localmente:

Bash

```
podman build -t [NOMBRE_DEL_PROYECTO]:local .
```

Levantar el entorno con compose:

Bash

```
podman compose up -d
```

> [!TIP] Si utilizas **Podman** en Linux en modo _rootless_, no necesitas permisos de superusuario (`sudo`) para interactuar con los contenedores o el orquestador.

## 📦 6. Descarga de Imágenes desde GHCR

Para utilizar directamente los artefactos generados por el pipeline de integración continua:

Bash

```
# Versión de staging (rama develop)
podman pull ghcr.io/[USUARIO]/[REPOSITORIO]:staging

# Versión de producción (rama main)
podman pull ghcr.io/[USUARIO]/[REPOSITORIO]:latest
```

> ### **Mantenimiento y Autoría:**
> 
> **Responsable:** [Tu Nombre / Usuario]
> 
> **Contacto:** [Tu Correo o Perfil de GitHub]
> 
> **Organización / Proyecto:** [Nombre de tu Entorno / Proyecto]

```

### Instrucciones para sustituir los marcadores de posición:
* Reemplaza `[NOMBRE_DEL_PROYECTO]` por el título o identificador de tu aplicación.
* Reemplaza `[USUARIO]` y `[REPOSITORIO]` por tu usuario (`manager-dev`) y el nombre del repo en GitHub.
* Si renombraste el archivo de actions a `workflow.yml`, actualiza la ruta dentro del árbol de directorios de la sección 4.
```

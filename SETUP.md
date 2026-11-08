# 🛠️ Guía de Configuración Inicial (Scaffolding Guide)

Este documento describe el procedimiento paso a paso para inicializar y personalizar un nuevo repositorio generado a partir de esta plantilla base.

> **Nota:** Este archivo es de uso exclusivo para el bootstrapping inicial del proyecto. El script `init.sh` lo eliminará automáticamente al concluir la parametrización para evitar redundancias con el `README.md`.

---

## 📋 Requisitos Previos

1. **Git** configurado en tu máquina local.
2. Acceso SSH validado contra GitHub (`ssh -T git@github.com` o tu alias SSH correspondiente como `github-ues`).
3. Motor de contenedores activo (**Docker Engine / Podman**).

---

## 🚀 Paso 1: Clonar el Repositorio

Clona el nuevo repositorio generado desde la plantilla e ingresa a su directorio raíz:

```bash
git clone git@github.com:<tu-usuario>/<tu-nuevo-repo>.git
cd <tu-nuevo-repo>
```

> Asegúrate de estar posicionado sobre la rama de trabajo predeterminada (`develop`):
> ```bash
> git switch develop
> ```

---

## ⚙️ Paso 2: Ejecutar el Script de Inicialización

Concede permisos de ejecución al script y lánzalo en la terminal:

```bash
chmod +x init.sh
./init.sh
```

### Parámetros solicitados por el asistente:

| Parámetro | Formato requerido | Ejemplo | Propósito |
| :--- | :--- | :--- | :--- |
| **Nombre del Proyecto** | `kebab-case` (minúsculas y guiones) | `encomiendas-envio-seguro` | Nombres de contenedores, base de datos local y tags OCI. |
| **Descripción** | Texto libre | `Sistema de gestión de encomiendas y envíos seguros` | Documentación en `README.md`. |
| **GitHub Owner** | Nombre de usuario u org (sin `@`) | `ca04073` | Define `CODEOWNERS` y compone `GITHUB_REPOSITORY` (`owner/repo`). |
| **Puerto del Contenedor** | Entero numérico | `8080` | `EXPOSE` y `ARG CONTAINER_PORT` en `Dockerfile` y red de Compose. |
| **Puerto del Host Local** | Entero numérico | `8080` | Mapeo de puerto anfitrión (`HOST_PORT`) en `compose.yaml`. |

### Acciones ejecutadas automáticamente por `init.sh`:
- Sustitución de variables en `README.md`, `compose.yaml`, `Dockerfile`, `.env.example`, `.github/CODEOWNERS`, `.devcontainer/devcontainer.json` y archivos modulares de `examples-docs/`.
- Configuración de `ARG CONTAINER_PORT=<puerto>` en `Dockerfile`.
- Generación del archivo `.env` local ya interpolado y listo para desarrollo.
- Activación de hooks locales en `.githooks/` (`core.hooksPath`).
- Eliminación de `SETUP.md` y autodestrucción de `init.sh`.

---

## 🛡️ Paso 3: Proteger la Rama `main` (Importar Ruleset)

Las políticas de seguridad del template no se heredan automáticamente en GitHub, pero el ruleset ya se encuentra preconfigurado en tu proyecto.

1. Abre tu nuevo repositorio en el navegador web de GitHub.
2. Ve a la pestaña **Settings** > menú lateral izquierdo **Rules** > **Rulesets**.
3. Haz clic en la flecha desplegable junto al botón verde **New ruleset** y selecciona **Import a ruleset**.
4. Sube el archivo ubicado en:
   ```text
   .github/rulesets/main-protection.json
   ```
5. Verifica que el estado de cumplimiento esté en **Active**.
6. Haz clic en **Save changes**.

> Esto blindará la rama `main` contra borrados accidentales, pushes forzados (`non-fast-forward`) y exigirá la validación del pipeline de CI/CD (`Lint & Validation` y `Build OCI Image`).

---

## 📤 Paso 4: Consolidar y Enviar Cambios

Verifica que el árbol de trabajo esté en orden y sube la configuración base a GitHub:

```bash
# 1. Comprobar archivos modificados y eliminados
git status

# 2. Agregar cambios y realizar el commit inicial
git add -A
git commit -m "chore: initialize project scaffolding and clean template setup"

# 3. Enviar a la rama develop
git push origin develop
```

A partir de este punto, el proyecto queda listo para el desarrollo diario del equipo bajo las instrucciones estándar de `README.md`.
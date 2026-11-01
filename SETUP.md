# 🛠️ Guía Rápida de Inicialización (SETUP)

Al generar un repositorio nuevo desde este template, ejecuta el inicializador automatizado para configurar variables y herramientas de seguridad en un solo paso.

## ⚡ Inicialización en 1 Paso

1. Abre tu terminal en la raíz del proyecto recién creado (en rama `develop`).

2. Concede permisos de ejecución al script y lánzalo:

```
chmod +x init.sh
./init.sh

```

El script te solicitará interactivamente:

* **Nombre del proyecto**

* **Descripción breve**

* **Usuario de GitHub** (para asignar automáticamente a los `CODEOWNERS`)

* **Puertos de contenedor y host** (para `compose.yaml` y `Dockerfile`)

Al finalizar, el script enlazará los **Git Hooks** locales y te ofrecerá autoeliminarse para no dejar archivos residuales en tu primer commit.

## 🛡️ Lista de Verificación en GitHub (Manual)

El script gestiona el entorno local, pero debes realizar estos 2 pasos únicos en la web de GitHub:

1. **Default Branch:** Ve a **Settings** > **General** > confirma que la rama por defecto sea **`develop`**.

2. **Branch Protection:** Ve a **Settings** > **Branches** (o **Rulesets**) y agrega la regla sobre **`main`**:

   * Marcar *Require a pull request before merging*.

   * Marcar *Require review from Code Owners*.

   * Marcar *Require status checks to pass before merging* (`lint-and-validate`).

   * Marcar *Do not allow force pushes*.

```

```
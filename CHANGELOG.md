# Changelog (Historial de Cambios) 📜

Todos los cambios notables de este proyecto serán documentados en este archivo. El formato está basado en [Keep a Changelog](https://keepachangelog.com) y este proyecto se adhiere a [Versionado Semántico](https://semver.org).

## 📌 Tipos de Cambios
- `Added`: Para nuevas características.
- `Changed`: Para cambios en funcionalidades existentes.
- `Deprecated`: Para características que se eliminarán en próximas versiones.
- `Removed`: Para características eliminadas en esta versión.
- `Fixed`: Para cualquier resolución de bugs o errores.
- `Security`: En caso de vulnerabilidades o mejoras de seguridad.

---

## [Unreleased]
*Cambios confirmados y mezclados en la rama principal que aún no se han incluido en una versión/tag oficial.*

### Added
- [ID-002] Estructura base de endpoints y controladores de la aplicación.

### Fixed
- [ID-004] Manejo de señales de terminación del contenedor para apagado limpio (*graceful shutdown*).

---

## [0.1.0] - 2026-10-25
*Línea base generada a partir de la plantilla.*

### Added
- [ID-001] Inicialización del proyecto, arquitectura base, compose y pipeline de CI.
- Documentación inicial (`README.md`, `BACKLOG.md`, `CHANGELOG.md`).

---

## 🛑 Guía de Formato (Copiar para Nueva Versión)

Cuando liberes una nueva versión, copia este bloque debajo de `## [Unreleased]`, reemplaza las variables y clasifica tus cambios:

```markdown
## [X.Y.Z] - AAAA-MM-DD

### Added
- Descripción del cambio o vinculación al ID del backlog.

### Changed
- Descripción del cambio.

### Fixed
- Descripción del bug corregido.
```

---

## 🔗 Enlaces de Comparación
*Generados automáticamente a partir del template.*

[Unreleased]: https://github.com/{{GITHUB_REPOSITORY}}/compare/v0.1.0...HEAD
[0.1.0]: https://github.com/{{GITHUB_REPOSITORY}}/releases/tag/v0.1.0

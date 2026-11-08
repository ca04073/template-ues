-- ==============================================================================
-- 🗄️ 02-schema.sql: Esquema inicial de tablas base
-- ==============================================================================
-- Ejecución: Automática vía /docker-entrypoint-initdb.d (solo primer arranque)
-- Orden: Se ejecuta después de las extensiones (01-init.sql)

\echo '------------------------------------------------------------'
\echo '🚀 [02-schema.sql] Creando tablas maestras iniciales...'
\echo '------------------------------------------------------------'

BEGIN;

-- Tabla de ejemplo: Usuarios del sistema
CREATE TABLE IF NOT EXISTS users (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    email VARCHAR(255) NOT NULL UNIQUE,
    full_name VARCHAR(150),
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Índice para búsquedas rápidas por correo
CREATE INDEX IF NOT EXISTS idx_users_email ON users(email);

COMMIT;

\echo '✅ [02-schema.sql] Tablas e índices iniciales creados exitosamente.'

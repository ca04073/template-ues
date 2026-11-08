-- ==============================================================================
-- 🗄️ INICIALIZACIÓN DE BASE DE DATOS LOCAL
-- ==============================================================================
-- Ubicación: examples-docs/sql/01-init.sql
-- Ejecución: Automática vía /docker-entrypoint-initdb.d al arrancar postgres

\echo '🔧 Configurando extensiones base...'

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS "pgcrypto";

\echo '📋 Creando estructura de tablas...'

CREATE TABLE IF NOT EXISTS healthcheck_ping (
    id SERIAL PRIMARY KEY,
    checked_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

\echo '✨ Inicializacion completada con exito.'

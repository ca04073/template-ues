FROM alpine:3.20

# Metadatos del contenedor
LABEL maintainer="manager-dev"
LABEL org.opencontainers.image.description="Baseline container image template"

# Utilidades mínimas esenciales
RUN apk add --no-cache \
    ca-certificates \
    tzdata \
    curl \
    bash

WORKDIR /app

# Puerto expuesto parametrizado
EXPOSE {{CONTAINER_PORT}}

# Punto de entrada por defecto
CMD ["sh"]

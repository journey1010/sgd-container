#!/bin/bash
set -e

# Ruta del dump temporal
SQL_FILE="/tmp/dump.sql"

echo ">>> Preparando inicialización dinámica de la base de datos..."

# 1. Si el usuario no es 'postgres', reemplazamos los OWNER en el SQL
if [ "$POSTGRES_USER" != "postgres" ]; then
    echo ">>> Detectado usuario personalizado: $POSTGRES_USER"
    echo ">>> Adaptando OWNER y privilegios en el script SQL..."
    # Reemplazo global de OWNER
    sed -i "s/OWNER TO postgres/OWNER TO $POSTGRES_USER/g" "$SQL_FILE"
    # Reemplazo de SCHEMA (común en dumps de pg_dump)
    sed -i "s/SCHEMA idosgd OWNER TO postgres/SCHEMA idosgd OWNER TO $POSTGRES_USER/g" "$SQL_FILE"
fi

# 2. Importar la base de datos
# El comando psql usará automáticamente las variables de entorno de Postgres
echo ">>> Cargando dump en la base de datos: $POSTGRES_DB (Esto puede tardar unos segundos)..."
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" -f "$SQL_FILE"

echo ">>> ¡Base de datos inicializada con éxito para el usuario $POSTGRES_USER!"

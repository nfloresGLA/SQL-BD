# SQL-BD

Proyecto de práctica de **MySQL** orientado a:

- DDL
- DML
- consultas
- joins
- subconsultas
- funciones
- updates y deletes controlados

## Estructura

- `sql/00_init.sql`: crea la base y ejecuta los scripts principales
- `sql/01_schema.sql`: crea tablas y relaciones
- `sql/02_imports.sql`: importa o adapta datos externos
- `sql/03_seed.sql`: inserta datos iniciales
- `sql/04_queries.sql`: consultas de práctica
- `sql/05_updates.sql`: cambios y actualizaciones
- `sql/99_cleanup.sql`: operaciones destructivas y limpieza

## Orden de ejecución

1. Ejecutar `sql/00_init.sql`
2. Revisar resultados en MySQL Workbench o VS Code
3. Ejecutar `sql/04_queries.sql` para pruebas
4. Usar `sql/99_cleanup.sql` solo si se desea reiniciar

## Reglas del proyecto

- No cambiar nombres de tablas a mitad del flujo
- No mezclar drops con scripts de creación
- Mantener claves foráneas activas
- Usar nombres en minúscula y consistentes

## Tablas principales

- `clientes`
- `articulos`
- `facturas`

## Objetivo

Contar con un proyecto SQL reproducible, claro y fácil de presentar.
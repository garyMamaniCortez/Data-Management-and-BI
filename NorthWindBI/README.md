# Data Management and BI - NorthWind Project

Proyecto de Data Management y Business Intelligence basado en la base de datos Northwind. Este proyecto contiene dos bases de datos: una OLTP para operaciones transaccionales y otra OLAP para análisis de datos.

## Cambios Realizados

Se agregaron tablas en ambas bases de datos como parte del desarrollo del sistema.

### Base de datos OLAP (NorthWindOLAP)

Se creó la tabla DimProducts que contiene información denormalizada de productos para análisis. Esta tabla incluye detalles de productos, categorías y proveedores en una sola estructura optimizada para consultas analíticas.

Se agregaron también tablas de dimensión para transportistas (DimShipper) y una tabla de configuración (PackageConfig) en el esquema dbo. En el esquema staging se creó una tabla intermedia para carga de datos de transportistas.

### Base de datos OLTP (NorthWindOLTP)

Se crearon las siguientes tablas para el sistema transaccional:

- Tabla Products: Almacena información de productos con campos como ProductID, ProductName, SupplierID, CategoryID, precios e inventario.
- Tabla Categories: Contiene la clasificación de productos.
- Tabla Suppliers: Guarda información de proveedores.
- Tabla shippers: Almacena datos de empresas de envío.

Se incluye también un script de carga de datos para transportistas.

## Estructura del Proyecto

El proyecto está organizado en dos carpetas principales:

NorthWindOLAP contiene los objetos de la base de datos analítica con subcarpetas para esquemas (dbo y staging) y scripts de configuración.

NorthWindOLTP contiene los objetos de la base de datos transaccional con tablas normalizadas y scripts de datos.

## Diferencia entre OLTP y OLAP

OLTP (NorthWindOLTP) es para operaciones transaccionales en tiempo real. Los datos están normalizados para evitar redundancia y se actualizan frecuentemente con inserciones, actualizaciones y eliminaciones.

OLAP (NorthWindOLAP) es para análisis y Business Intelligence. Los datos están denormalizados para optimizar consultas analíticas y se actualizan periódicamente mediante procesos ETL.

## Notas

Se resolvió un conflicto de merge en el archivo NorthWindOLAP.sqlproj durante la sincronización con la rama remota.

La rama Dev-Erick está sincronizada con origin/Dev-Erick.

# Sistema de Gestión y Comercio Electrónico para Tienda de Videojuegos
#EN PROCESO

## Descripción

Este repositorio contiene el código fuente del sistema integral para la gestión interna (backoffice) y la plataforma de ventas en línea de una tienda especializada en videojuegos (tipo GamePlanet). El sistema permite:

* Administración de catálogo de productos.
* Gestión de inventarios y movimientos.
* Proceso de ventas y preventas.
* Carrito de compras y conversión a órdenes.
* Programa de lealtad para clientes frecuentes.
* Reportes automatizados y auditoría de operaciones.

## Características Principales

1. **Backoffice**: panel de administración para empleados y administradores.
2. **Ecommerce**: interfaz pública para los clientes.
3. **API Restful**: capa de servicios centralizada para ambas plataformas.
4. **Base de datos relacional**: con esquema normalizado (MySQL/MariaDB).
5. **Seguridad**: control de roles y permisos.
6. **Escalabilidad**: arquitectura desacoplada y preparada para crecimiento.

## Arquitectura

```
[ Cliente Web ]         [ Backoffice Admin ]
           \                           /
            \                         /
             --- API RESTful Services ---
                      |
              [ Base de Datos SQL ]
```

* **Frontends**: Por definir.
* **Backend**: Por definir.
* **BD**: MySQL con tablas principales:

  * Usuario
  * Producto, Categoria, Proveedor
  * Inventario, Detalle_inventario
  * Carrito, Detalle_carrito
  * Venta, Detalle_venta
  * ProgramaLealtad (Puntos, Recompensa, Redencion)

## Tecnologías Utilizadas

* Por definir

## Contacto

Para dudas o sugerencias, crea un issue.

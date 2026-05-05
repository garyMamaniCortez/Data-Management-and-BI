-- Tabla: Products
-- Descripcion: Tabla de productos del sistema OLTP normalizado
-- Contiene informacion de productos con referencias a categorias y proveedores
-- Proposito: Almacenar datos transaccionales de productos para operaciones del negocio
-- Uso: Sistema de ordenes, inventario y ventas en tiempo real

CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,					-- Clave primaria del producto
	[ProductName] [nvarchar](40) NOT NULL,						-- Nombre del producto
	[SupplierID] [int] NULL,									-- Referencia al proveedor
	[CategoryID] [int] NULL,									-- Referencia a la categoria
	[QuantityPerUnit] [nvarchar](20) NULL,						-- Cantidad por unidad
	[UnitPrice] [money] NULL,									-- Precio unitario
	[UnitsInStock] [smallint] NULL,								-- Unidades disponibles en inventario
	[UnitsOnOrder] [smallint] NULL,								-- Unidades pendientes de recibir
	[ReorderLevel] [smallint] NULL,								-- Cantidad minima antes de reordenar
	[Discontinued] [bit] NOT NULL,								-- Indicador de producto descontinuado
	[rowversion] [timestamp] NULL,								-- Control de concurrencia y versionado de filas
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
-- Tabla de Dimension: DimProduct
-- Descripcion: Tabla denormalizada para analisis de productos en el OLAP
-- Contiene informacion de productos, categorias y proveedores integrada en una sola estructura
-- Proposito: Optimizar consultas analiticas y reportes de productos
-- Uso: Business Intelligence y analisis de ventas por producto

CREATE TABLE [dbo].[DimProduct](
	[ProductSK] [int] IDENTITY(1,1) NOT NULL,					-- Clave surrogada del producto
	[ProductID] [int] NOT NULL,									-- ID original del producto
	[ProductName] [nvarchar](40) NOT NULL,						-- Nombre del producto
	[QuantityPerUnit] [nvarchar](20) NULL,						-- Cantidad por unidad
	[UnitPrice] [money] NULL,									-- Precio unitario
	[UnitsInStock] [smallint] NULL,								-- Unidades en stock
	[UnitsOnOrder] [smallint] NULL,								-- Unidades en orden
	[ReorderLevel] [smallint] NULL,								-- Nivel de reorden
	[Discontinued] [bit] NOT NULL,								-- Indicador de producto discontinuado
	[CategoryID] [int] NULL,									-- ID de categoria
	[CategoryName] [nvarchar](15) NOT NULL,						-- Nombre de la categoria
	[SupplierID] [int] NULL,									-- ID del proveedor
	[SupplierCompanyName] [nvarchar](40) NOT NULL,				-- Nombre de la empresa proveedora
	[SupplierContactName] [nvarchar](30) NULL,					-- Nombre del contacto del proveedor
	[SupplierCity] [nvarchar](15) NULL,							-- Ciudad del proveedor
	[SupplierCountry] [nvarchar](15) NULL,						-- Pais del proveedor
 CONSTRAINT [PK_DimProduct] PRIMARY KEY CLUSTERED 
(
	[ProductSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

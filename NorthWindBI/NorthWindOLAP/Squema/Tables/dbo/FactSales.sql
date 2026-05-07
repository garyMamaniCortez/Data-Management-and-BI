-- Tabla de Hechos: FactSales
-- Tipo: OLAP / Data Warehouse
-- Descripcion: Tabla central de hechos del modelo estrella orientado al analisis de ventas
-- Contiene las metricas y medidas generadas a partir de las transacciones del sistema OLTP
-- Proposito: Facilitar consultas analiticas, reportes y procesos de Business Intelligence
-- Uso: Analisis de ventas, ingresos, descuentos, tendencias y rendimiento comercial

CREATE TABLE [dbo].[FactSales](
	[OrderDateSK] [int] NOT NULL,				-- Clave surrogate de la fecha de orden
	[RequiredDateSK] [int] NULL,				-- Clave surrogate de la fecha requerida de entrega
	[ShippedDateSK] [int] NULL,					-- Clave surrogate de la fecha de envio
	[CustomerSK] [int] NOT NULL,				-- Clave surrogate del cliente
	[ProductSK] [int] NOT NULL,					-- Clave surrogate del producto
	[EmployeeSK] [int] NOT NULL,				-- Clave surrogate del empleado
	[ShipperSK] [int] NOT NULL,					-- Clave surrogate de la empresa de envio
	[OrderID] [int] NOT NULL,					-- ID original de la orden proveniente del OLTP
	[ProductID] [int] NOT NULL,					-- ID original del producto proveniente del OLTP
	[Quantity] [int] NOT NULL,					-- Cantidad total de productos vendidos
	[UnitPrice] [money] NOT NULL,				-- Precio unitario del producto al momento de la venta
	[Discount] [real] NOT NULL,					-- Porcentaje de descuento aplicado
	[DiscountAmount] [money] NOT NULL,			-- Monto monetario descontado
	[NetSales] [money] NOT NULL,				-- Venta neta despues del descuento
	[Freight] [money] NULL,						-- Costo de envio asociado a la orden
	[GrossRevenue] [money] NOT NULL,			-- Ingreso bruto antes de descuentos
 CONSTRAINT [PK_FactSales] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
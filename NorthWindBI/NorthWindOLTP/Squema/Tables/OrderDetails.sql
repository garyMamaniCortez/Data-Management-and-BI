-- Tabla: OrderDetails
-- Tipo: OLTP / Transaccional
-- Descripcion: Tabla de detalle de productos asociados a cada orden del sistema ecommerce
-- Contiene informacion especifica de los productos vendidos en cada pedido
-- Proposito: Registrar cantidades, precios y descuentos aplicados por producto dentro de una orden
-- Uso: Procesamiento de ventas, calculo de ingresos y soporte para procesos ETL hacia el Data Warehouse

CREATE TABLE [dbo].[OrderDetails](
	[OrderID] [int] NOT NULL,				-- Referencia a la orden asociada
	[ProductID] [int] NOT NULL,				-- Referencia al producto vendido
	[UnitPrice] [money] NOT NULL,			-- Precio unitario del producto al momento de la venta
	[Quantity] [smallint] NOT NULL,			-- Cantidad de unidades vendidas
	[Discount] [real] NOT NULL,				-- Porcentaje de descuento aplicado al producto
	[rowversion] [timestamp] NULL,			-- Control de concurrencia y soporte para ETL incremental
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
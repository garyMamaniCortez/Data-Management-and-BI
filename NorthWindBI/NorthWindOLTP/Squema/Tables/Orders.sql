-- Tabla: Orders
-- Tipo: OLTP / Transaccional
-- Descripcion: Tabla principal de ordenes del sistema ecommerce
-- Contiene la informacion general de cada pedido realizado por los clientes
-- Proposito: Gestionar transacciones de ventas, envios y seguimiento de pedidos
-- Uso: Procesamiento de ordenes, logistica y analisis operacional en tiempo real

CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,		-- Clave primaria de la orden
	[CustomerID] [nchar](5) NULL,				-- Referencia al cliente que realiza la orden
	[EmployeeID] [int] NULL,					-- Referencia al empleado responsable de la orden
	[OrderDate] [datetime] NULL,				-- Fecha en la que se realizo la orden
	[RequiredDate] [datetime] NULL,				-- Fecha requerida de entrega
	[ShippedDate] [datetime] NULL,				-- Fecha real de envio de la orden
	[ShipVia] [int] NULL,						-- Referencia al metodo o empresa de envio
	[Freight] [money] NULL,						-- Costo de envio o flete
	[ShipName] [nvarchar](40) NULL,				-- Nombre del destinatario o empresa receptora
	[ShipAddress] [nvarchar](60) NULL,			-- Direccion de envio
	[ShipCity] [nvarchar](15) NULL,				-- Ciudad de envio
	[ShipRegion] [nvarchar](15) NULL,			-- Region de envio	
	[ShipPostalCode] [nvarchar](10) NULL,		-- Codigo postal del destino
	[ShipCountry] [nvarchar](15) NULL,			-- Pais de envio
	[rowversion] [timestamp] NULL,				-- Control de concurrencia y soporte para ETL incremental
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
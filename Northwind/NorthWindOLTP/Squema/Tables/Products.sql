CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](40) NOT NULL,
	[SupplierID] [int] NULL,
	[CategoryID] [int] NULL,
	[QuantityPerUnit] [nvarchar](20) NULL,
	[UnitPrice] [money] NULL,
	[UnitsInStock] [smallint] NULL,
	[UnitsOnOrder] [smallint] NULL,
	[ReorderLevel] [smallint] NULL,
	[Discontinued] [bit] NOT NULL,
	[rowversion] [timestamp] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO

ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO

ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Suppliers] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Suppliers] ([SupplierID])
GO

ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Suppliers]
GO

ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [CK_Products_ReorderLevel] CHECK  (([ReorderLevel]>=(0)))
GO

ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [CK_Products_ReorderLevel]
GO

ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [CK_Products_UnitPrice] CHECK  (([UnitPrice]>=(0)))
GO

ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [CK_Products_UnitPrice]
GO

ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [CK_Products_UnitsInStock] CHECK  (([UnitsInStock]>=(0)))
GO

ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [CK_Products_UnitsInStock]
GO

ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [CK_Products_UnitsOnOrder] CHECK  (([UnitsOnOrder]>=(0)))
GO

ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [CK_Products_UnitsOnOrder]
GO

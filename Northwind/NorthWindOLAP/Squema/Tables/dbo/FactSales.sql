CREATE TABLE [dbo].[FactSales](
	[OrderDateSK] [int] NOT NULL,
	[RequiredDateSK] [int] NULL,
	[ShippedDateSK] [int] NULL,
	[CustomerSK] [int] NOT NULL,
	[ProductSK] [int] NOT NULL,
	[EmployeeSK] [int] NOT NULL,
	[ShipperSK] [int] NOT NULL,
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[Discount] [real] NOT NULL,
	[DiscountAmount] [money] NOT NULL,
	[NetSales] [money] NOT NULL,
	[Freight] [money] NULL,
	[GrossRevenue] [money] NOT NULL,
 CONSTRAINT [PK_FactSales] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[FactSales]  WITH CHECK ADD  CONSTRAINT [FK_FactSales_DimCustomer] FOREIGN KEY([CustomerSK])
REFERENCES [dbo].[DimCustomer] ([CustomerSK])
GO

ALTER TABLE [dbo].[FactSales] CHECK CONSTRAINT [FK_FactSales_DimCustomer]
GO

ALTER TABLE [dbo].[FactSales]  WITH CHECK ADD  CONSTRAINT [FK_FactSales_DimDate_OrderDate] FOREIGN KEY([OrderDateSK])
REFERENCES [dbo].[DimDate] ([DateSK])
GO

ALTER TABLE [dbo].[FactSales] CHECK CONSTRAINT [FK_FactSales_DimDate_OrderDate]
GO

ALTER TABLE [dbo].[FactSales]  WITH CHECK ADD  CONSTRAINT [FK_FactSales_DimDate_RequiredDate] FOREIGN KEY([RequiredDateSK])
REFERENCES [dbo].[DimDate] ([DateSK])
GO

ALTER TABLE [dbo].[FactSales] CHECK CONSTRAINT [FK_FactSales_DimDate_RequiredDate]
GO

ALTER TABLE [dbo].[FactSales]  WITH CHECK ADD  CONSTRAINT [FK_FactSales_DimDate_ShippedDate] FOREIGN KEY([ShippedDateSK])
REFERENCES [dbo].[DimDate] ([DateSK])
GO

ALTER TABLE [dbo].[FactSales] CHECK CONSTRAINT [FK_FactSales_DimDate_ShippedDate]
GO

ALTER TABLE [dbo].[FactSales]  WITH CHECK ADD  CONSTRAINT [FK_FactSales_DimEmployee] FOREIGN KEY([EmployeeSK])
REFERENCES [dbo].[DimEmployee] ([EmployeeSK])
GO

ALTER TABLE [dbo].[FactSales] CHECK CONSTRAINT [FK_FactSales_DimEmployee]
GO

ALTER TABLE [dbo].[FactSales]  WITH CHECK ADD  CONSTRAINT [FK_FactSales_DimProduct] FOREIGN KEY([ProductSK])
REFERENCES [dbo].[DimProduct] ([ProductSK])
GO

ALTER TABLE [dbo].[FactSales] CHECK CONSTRAINT [FK_FactSales_DimProduct]
GO

ALTER TABLE [dbo].[FactSales]  WITH CHECK ADD  CONSTRAINT [FK_FactSales_DimShipper] FOREIGN KEY([ShipperSK])
REFERENCES [dbo].[DimShipper] ([ShipperSK])
GO

ALTER TABLE [dbo].[FactSales] CHECK CONSTRAINT [FK_FactSales_DimShipper]
GO
